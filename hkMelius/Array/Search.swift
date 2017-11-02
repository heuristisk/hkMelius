//
//  Search.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Array2D {
    
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
