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

//var people = [Person]()
//
//people.append(Person(birthYear: 1999, deathYear: 2015))
//people.append(Person(birthYear: 2000, deathYear: 2016))
//
//
//Population().calcMostAliveYear(people: people)

//func adjacentElementsProduct(inputArray: [Int]) -> Int {
//
//    var maxValuePosition = 0
//    var maxValue = inputArray.first ?? 0
//    let maxIndex = (inputArray.count - 1)
//    
//    for i in 0 ... maxIndex {
//        if inputArray[i] > maxValue {
//            maxValue = inputArray[i]
//            maxValuePosition = i
//        }
//    }
//
//    if maxValuePosition == maxIndex {
//        return inputArray[maxValuePosition] * inputArray[maxValuePosition-1]
//    } else if maxValuePosition == 0 {
//        return inputArray[maxValuePosition] * inputArray[maxValuePosition+1]
//    } else {
//        let a = inputArray[maxValuePosition] * inputArray[maxValuePosition-1]
//        let b = inputArray[maxValuePosition] * inputArray[maxValuePosition+1]
//
//        return (a > b) ? a : b
//    }
//}
//
//adjacentElementsProduct(inputArray: [3, 6, -2, -5, 7, 3])

import Foundation

func swapLexOrder(str: String, pairs: [[Int]]) -> String {

    var result = [UInt8]()
    var max = 0
    var array = str.utf8.map({UInt8($0)})

    for i in 0 ..< pairs.count {

        let r = swapper(positions: &array, array: pairs[i])
        if r > max {
            max = r
            result = array
        }
    }

    return String(bytes: result, encoding: String.Encoding.utf8) ?? ""
}

func swapper(positions: inout [UInt8], array: [Int]) -> Int {
    swap(&positions[array[0]-1],&positions[array[1]-1])

    var sum = 0

    positions.forEach({
        sum += Int($0)
    })

    return sum
}

print(swapLexOrder(str: "abdc", pairs: [[1, 4], [3, 4]]))





