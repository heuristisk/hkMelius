import Foundation

class LinkedList<T: Equatable>: CustomStringConvertible {
    
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
        var value: T
        var next: Node?
        
        public var description: String {
            return String("NODE [\(value)]")
        }
        
        init(value: T) {
            self.value = value
        }
        
        public static func ==(lhs: Node, rhs: Node) -> Bool {
            return lhs.value == rhs.value
        }
    }
    
    func delete(k: T) {
        
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
    
    func deleteDuplicateUsingBuffer() {
        
        var array = [T]()
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
