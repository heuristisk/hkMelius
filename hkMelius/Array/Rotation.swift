//
//  Array.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation


class Rotation {
    
    static func dummy() {

    }
    
    var columnContainer = [Int:Set<Character>]()

    func rorateImageCounterClockWise(matrix: inout [[Int]]) -> [[Int]] {

        let n = matrix[0].count
        var tmp = 0
        for i in 0 ..< n/2 {
            for j in i ..< n - i - 1 {
                tmp = matrix[i][j]
                matrix[i][j] = matrix[j][n - i - 1]
                matrix[j][n - i - 1] = matrix[n - i - 1][n - j - 1]
                matrix[n - i - 1][n - j - 1] = matrix[n - j - 1][i]
                matrix[n - j - 1][i] = tmp
            }
            
        }
        return matrix;
    }
    
    static func rotateInPlace( input array : inout [[Int]]) {
        
        for layer in 0 ..< array.count/2  {
            let first = layer
            let last =  array.count - 1 - first;
            
            for i in first ..< last {
                let offset = i - first
                let top = array[first][i];
                array[first][i] = array[last - offset][first]
                array[last - offset][first] = array[last][last - offset]
                array[last][last - offset] = array[i][last]
                array[i][last] = top
            }
            
        }
    }
    
    static func rotateOutOfPlace(this input: [[Int]]) -> [[Int]] {
        
        var result = [[Int]](repeating: [Int](repeating: 0, count: input.count), count: input.first?.count ?? 0)
        
        for i in 0 ..< result.count {
            for j in 0 ..< result[i].count {
                let index = getNewIndex(i, j, size: result[i].count)
                result[i][j] = input[index.i][index.j]
            }
        }
        
        return result
    }
    
    private static func getNewIndex(_ i: Int,_ j: Int, size: Int) -> (i: Int, j: Int) {
        
        let newJ = i
        let newI = (size - 1) - j
        
        return (newI,newJ)
    }
    
}

extension Array  {
    
    class Rotation {
        enum Direction {
            case left
            case right
        }
    }
    
    static func rotate<T>(input: [T], number: Int, direction: Rotation.Direction) -> [T] {
        var result = [T]()
        
        if direction == .left { //<<--
            for i in (0 ..< input.count) {
                let newIndex = (number + i) % input.count
                result.append(input[newIndex])
            }
        } else { // -->>
            for i in (0 ..< input.count).reversed() {
                let newIndex = (number + i) % input.count
                result.append(input[(input.count - 1) - newIndex])
            }
        }
        
        return result
    }
    
    mutating func rotate(number: Int, direction: Rotation.Direction) {
        
        for _ in 1 ... number {
            if direction == .left {
                rotateLeftByOne()
            } else {
                rotateRightByOne()
            }
        }
    }
    
    private mutating func rotateRightByOne() {
        
        var i = self.count-1
        let lastValue = self[i]
        
        while i > 0 {
            self[i] = self[i-1]
            i -= 1
        }
        
        self[i] = lastValue
    }
    
    private mutating func rotateLeftByOne() {
        let firstValue = self[0]
        var i = 0
        
        while i < self.count - 1 {
            self[i] = self[i+1]
            i += 1
        }
        
        self[i] = firstValue
    }
}
