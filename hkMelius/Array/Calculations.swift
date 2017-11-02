//
//  Calculations.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Calculation {
    
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
