//
//  Calculations.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

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
