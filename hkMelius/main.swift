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

func composeRanges(nums: [Int]) -> [String] {
    var ranges = [String]()
    if nums.count == 0 {
        return ranges
    }
    var first = nums[0]
    var last = nums[0]
    for i in 1..<nums.count {
        if nums[i] > nums[i-1] + 1 {
            ranges.append(first == last ? "\(first)" : "\(first)->\(last)")
            first = nums[i]
        }
        last = nums[i]
    }
    ranges.append(first == last ? "\(first)" : "\(first)->\(last)")
    return ranges
}

print(composeRanges(nums: [1,2,3,4,6,7,8,9]))




