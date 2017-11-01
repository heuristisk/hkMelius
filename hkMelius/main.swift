
import Foundation



let l = LinkedList<Int>(head: LinkedList<Int>.Node(value: 0))

var node = l.head

for i in [1,2,3,4,5,6,7,8,9] {
    
    node?.next = LinkedList<Int>.Node(value: i)
    node = node?.next
}

l.reverse()

print(l)
