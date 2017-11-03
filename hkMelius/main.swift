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

let a = LinkedList.Node(value: 9876)
a.next = LinkedList.Node(value: 5432)
a.next?.next = LinkedList.Node(value: 1999)

let b = LinkedList.Node(value: 1)
b.next = LinkedList.Node(value: 8001)


let result = LinkedList(head: LinkedList.Node(value: 0)).addTwoHugeNumbers(a: a, b: b)

print(result)

//[9876, 5434, 0]
