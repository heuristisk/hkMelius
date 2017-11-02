
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
var grid: [[Character]] =
    [[".","4",".",".",".",".",".",".","."],
     [".",".","4",".",".",".",".",".","."],
     [".",".",".","1",".",".","7",".","."],
     [".",".",".",".",".",".",".",".","."],
     [".",".",".","3",".",".",".","6","."],
     [".",".",".",".",".","6",".","9","."],
     [".",".",".",".","1",".",".",".","."],
     [".",".",".",".",".",".","2",".","."],
     [".",".",".","8",".",".",".",".","."]]

print(Array2D.sudoku2(grid: grid))
