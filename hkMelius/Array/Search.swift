//
//  Search.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Array2D {


    static func findRotationPoint(in numbers: [Int]) -> Int {
        let firstRef = numbers[0]

        var low = 0
        var high = numbers.count - 1

        while low < high {
            let guessIndex = low + ((high - low) / 2)
            if numbers[guessIndex] >= firstRef {
                low = guessIndex
            } else {
                high = guessIndex
            }

            if (low + 1) == high {
                break
            }
        }
        return high
    }

    static func sudoku1(grid: [[Character]]) -> Bool {
        
        var seen = Set<String>()
        
        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                if grid[i][j] != "." {
                    let value = String(grid[i][j])
                    
                    let row = "row \(i): \(value)"
                    let col = "col \(j): \(value)"
                    let sub = "sub \(i/3)|\(j/3): \(value)"
                    
                    if seen.contains(row) || seen.contains(col) || seen.contains(sub) {
                        return false
                    }
                    else {
                        seen.insert(row)
                        seen.insert(col)
                        seen.insert(sub)
                    }
                }
            }
        }
        
        return true
        
    }
    
    static func sudoku2(grid: [[Character]]) -> Bool {
        
        var columnContainer = [Int:Set<Character>]()
        
        for i in 0 ..< grid.count {
            
            var rowContainer = Set<Character>()
            
            for j in 0 ..< grid[0].count {
                
                let ch = grid[i][j]
                
                if ch != "." && (rowContainer.contains(ch) || columnContainer[j]?.contains(ch) ?? false){
                    return false
                } else if ch != "." {
                    if columnContainer[j] == nil {
                        columnContainer[j] = Set<Character>()
                    }
                    
                    rowContainer.insert(ch)
                    columnContainer[j]?.insert(ch)
                }
            }
        }
        
        for col in [0,3,6] {
            
            for row in [0,3,6] {
                
                var squareContainer = Set<Character>()
                
                for i in col ..< col + 3 {
                    for j in row ..< row + 3 {
                        let ch = grid[i][j]
                        
                        if ch != "." {
                            
                            if squareContainer.contains(ch) {
                                return false
                            }
                            
                            squareContainer.insert(ch)
                        }
                    }
                }
                
            }
        }
        
        return true
    }
    
    static func firstDuplicate(a: [Int]) -> Int {
        
        var array =  a
        
        for i in 0 ..< array.count {
            if (array[abs(array[i]) - 1] >= 0) {
                array[abs(array[i]) - 1] *= -1
            }
            else {
                return abs(array[i])
            }
        }
        return -1
    }
    
    static func firstDuplicate2(a: [Int]) -> Int {
        var set:Set<Int> = Set()
        for i in a {
            if(set.contains(i)) {
                return i;
            } else {
                set.insert(i);
            }
        }
        return -1;
    }

    
    static func find(array: [[Int]], value: Int) -> (row: Int, col: Int)? {
        
        let rows = array.count
        let cols = array[0].count
        var start = 0
        var end = rows * cols - 1
        
        while (start <= end) {
            
            let mid = start + (end - start) / 2
            let row = mid / cols
            let col = mid % cols
            let v = array[row][col]
            
            if (v == value) {
                return (row,col)
            }
            
            if v > value {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return nil
    }
}
