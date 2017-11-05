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
//123, 456, 789, 0


let root = Tree<Int>(3)

root.left = Tree<Int>(1)
root.right = Tree<Int>(5)


root.right?.left = Tree<Int>(4)
root.right?.right = Tree<Int>(6)


var acc = [Int]()
root.traverseInOrder(process: { v in acc.append(v) })

let a = root.search(value: 5)
print(a)

