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
    
    func delete(value: T) {
        
        var temp = head;
        
        if (value == temp?.value)
        {
            head = temp?.next
            return
        }
        
        while temp?.next != nil {
            if value == temp?.next?.value {
                temp?.next =  temp?.next?.next
            }
            
            temp = temp?.next;
        }
    }
    
    func reverse() {
        
        var current = head;
        var previous: Node? = nil
        var incoming: Node? = nil
        
        while current != nil {
            incoming = current?.next
            current?.next = previous
            previous = current
            current = incoming;
        }
        
        head = previous;
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
            
            node = node?.next
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
