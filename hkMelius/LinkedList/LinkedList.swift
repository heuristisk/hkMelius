import Foundation

class LinkedList: CustomStringConvertible {
    
    var head: Node?
    var tail: Node? {
        get {
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            
            return node
        }
    }
    
    init(head: Node) {
        self.head = head
    }
    
    class Node : Equatable, CustomStringConvertible {
        var value: Int
        var next: Node?
        
        public var description: String {
            return String("NODE [\(value)]")
        }
        
        init(value: Int) {
            self.value = value
        }
        
        public static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs.value == rhs.value
        }
    }
    
    func delete(k: Int) {
        
        var temp = head;
        var previous: Node? = nil
        
        while temp != nil {
            if k == temp?.value {
                
                if previous == nil {
                    head = temp?.next
                    temp = head
                    continue
                } else {
                    previous?.next = temp?.next
                }
            } else {
                previous = temp
            }
            
            temp = temp?.next
        }
    }
    
    func rearrangeLastN(l: Node?, n: Int) -> Node? {
        
        if n == 0 {
            return l
        }
        
        let head = l
        var pointer = head
        var tail = head
        var finalhead = head
        var tolink = head
        var size = 0

        while (pointer != nil) {
            size += 1
            if pointer?.next == nil {
                tail = pointer
            }
            pointer = pointer?.next
        }
        
        var steps = size - n
        pointer = head
        
        while (steps > 0) {
            steps -= 1
            if steps == 0 {
                tolink = pointer
                finalhead = pointer?.next
                tail?.next = head
                tolink?.next = nil
            }
            
            pointer = pointer?.next
        }

        
        return finalhead
    }
    

    
    func reverse(node: Node?) -> Node? {
        
        var node = node
        var head: Node? = nil
        
        while node != nil {
            let n = Node(value: node!.value)
            n.next = head
            head = n
            node = node?.next
        }
        
        return head
    }
    
    func addTwoHugeNumbers(a: Node?, b: Node?) -> Node? {
        
        return reverse(node: addLinkedList(a: reverse(node: a), b: reverse(node: b), carry: 0))
    }
    
    func addLinkedList(a: Node?, b: Node?, carry: Int) -> Node? {
        
        if a == nil && b == nil && carry == 0 {
            return nil
        }
        
        let result = Node(value: 0)
        
        var value = carry
        
        if a != nil {
            value += a!.value
        }
        
        if b != nil {
            value += b!.value
        }
        
        result.value = value % 10000
        
        if a != nil || b != nil {
            let more = addLinkedList(a: a == nil ? nil : a?.next,
                                     b: b == nil ? nil : b?.next,
                                     carry: value >= 10000 ? 1 : 0)
            result.next = more
        }
        
        return result
    }

    
    func isListPalindrome(node: Node?) -> Bool {
        
        var reversedList = reverse(node: node)
        var temp = node
        
        while (temp != nil && reversedList != nil) {
            if temp?.value != reversedList?.value {
                return false
            }
            
            temp = temp?.next
            reversedList = reversedList?.next
        }
        
        return reversedList == nil && temp == nil
    }
    
    func detectCycle(disconnect: Bool = false) -> Node? {
        
        var slow = head
        var fast = head
        var previous: Node? = nil
        
        while slow != nil && fast != nil && fast?.next != nil {
            previous = slow
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow == fast {
                if disconnect {
                    previous?.next = nil
                }
                return previous
            }
        }
        
        return nil
    }
    
    func mergeTwoLinkedLists(l1: Node?, l2: Node?) -> Node? {
        
        var result: Node?
        
        if l1 == nil {
            return l2;
        }
        if l2 == nil {
            return l1
        }
        
        if (l1!.value <= l2!.value)
        {
            result = l1
            result?.next = mergeTwoLinkedLists(l1: l1?.next,l2: l2)
        } else {
            result = l2
            result?.next = mergeTwoLinkedLists(l1: l1,l2: l2?.next)
        }
        
        return result
    }
    
    
    func deleteDuplicateUsingBuffer() {
        
        var array = [Int]()
        var current: Node? = self.head
        var previous: Node? = nil
        
        while current != nil {
            if let c = current {
                if array.contains(c.value) {
                    previous?.next = current?.next
                } else {
                    array.append(c.value)
                    previous = current
                }
            }
            
            current = current?.next
        }
    }
}

extension LinkedList {
    
    public var description: String {
        
        var result = "LinkedList := "
        var node: Node? =  head
        while node != nil {
            result += String("\(node!.value) => ")
            node = node?.next
        }
        
        return "\(result)null"
    }
}
