import Foundation

//let l = LinkedList<Int>(head: LinkedList<Int>.Node(value: 0))
//
//var node = l.head
//
//for i in [1,2,3,4,5,6,7,8,9] {
//
//    node?.next = LinkedList<Int>.Node(value: i)
//    node = node?.next
//}
//
//l.reverse()
//
//print(l)


//let str = "cat"
//
//for p in str.getPermutations() {
//    print(p)
//}
//
// Definition for singly-linked list:

let a = LinkedList.Node(value: 1)
a.next = LinkedList.Node(value: 3)
a.next?.next = LinkedList.Node(value: 5)

let b = LinkedList.Node(value: 2)
b.next = LinkedList.Node(value: 4)


let result = LinkedList(head: LinkedList.Node(value: 0)).mergeTwoLinkedLists(l1: a, l2: b)

print(result)

//[9876, 5434, 0]
