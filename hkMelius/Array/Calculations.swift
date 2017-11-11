//
//  Calculations.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Calculation {

    func minesweeper(matrix: [[Bool]]) -> [[Int]] {
        var m = matrix.map { $0.map { $0 ? 1 : 0 } }
        var new = m.map { $0.map { _ in 0 } }

        for r in 0 ..< m.count {
            for c in 0 ..< m[r].count {

                for r1 in max(r-1,0)...min(r+1,m.count-1) {
                    for c1 in max(c-1,0)...min(c+1,m[r].count-1) {
                        if r1 != r || c1 != c {
                            new[r][c] += m[r1][c1]
                        }
                    }
                }
            }
        }
        return new
    }

    static func isCryptSolution(crypt: [String], solution: [[Character]]) -> Bool {
        
        var map = convertToDictionary(solution: solution)
        var convertedData = [Int: String]()
        
        for (i,word) in crypt.enumerated() {
            
            for ch in word.characters {
                
                if convertedData[i] == nil && map[ch] == "0" && word.characters.count > 1 {
                    return false
                }
                
                convertedData[i] = String("\(convertedData[i] ?? "")\(map[ch] ?? "0")")
            }
        }
        
        let a = Int(convertedData[0] ?? "0") ?? 0
        let b = Int(convertedData[1] ?? "0") ?? 0
        let c = Int(convertedData[2] ?? "0") ?? 0
        
        return (a + b) == c
    }
    
    static func convertToDictionary(solution: [[Character]]) -> [Character:Character] {
        
        var result = [Character:Character]()
        
        for i in 0 ..< solution.count {
            result[solution[i][0]] = solution[i][1]
        }
        
        return result
    }

    func rotateByOneRight(matrix: inout [Int], offset: Int) -> [Int] {

        for n in 1 ..< offset {
            for i in (0 ..< (matrix.count - 1)).reversed() {
                swap(&matrix[i], &matrix[(i+1) % matrix.count])
            }
        }

        return matrix
    }

    func rotateByOneLeft(matrix: inout [Int], offset: Int) -> [Int] {

        for n in 1 ..< offset {
            for i in 0 ..< matrix.count - 1 {
                swap(&matrix[i], &matrix[(i+1) % matrix.count])
            }
        }
        
        return matrix
    }
}

extension Array where Iterator.Element == Int {
    
    func getProductsOfAllIntsExceptAtIndex() -> [Int] {
        
        var products = Array(repeating: 0, count: self.count)
        
        var productSoFar = 1
        for i in 0 ..< self.count {
            products[i] = productSoFar
            productSoFar *= self[i]
        }
        
        productSoFar = 1
        for i in ( 0 ..< self.count).reversed() {
            products[i] *= productSoFar
            productSoFar *= self[i]
        }
        
        return products
    }
}
