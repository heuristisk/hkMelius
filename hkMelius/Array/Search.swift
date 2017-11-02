//
//  Search.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Array2D {
    
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
