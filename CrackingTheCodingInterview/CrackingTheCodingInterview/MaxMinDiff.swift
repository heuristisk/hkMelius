//
//  MaxMinDiff.swift
//  CrackingTheCodingInterview
//
//  Created by Anderson Santos Gusmao on 08/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class MaxMinDiff {
    let a1 = [1,54,77,12,23,12,11]
    let a2 = [4,22,27,21,115,156]

    func getMaxDifference(between a1: [Int], and a2: [Int]) -> Int {

        let array1 = a1.sorted()
        let array2 = a2.sorted()

        var i1 = 0
        var i2 = 0
        var difference = Int.min

        while (array1.count > i1 && array2.count > i2) {

            let tmp = abs(array1[i1] - array2[i2])

            if  tmp > difference {
                difference = tmp
                print("\(array1[i1]) - \(array2[i2])")
            }

            if array1[i1] > array2[i2] {
                i1 += 1
            } else {
                i2 += 1
            }
        }

        return difference
    }

    func getMinDifference(between a1: [Int], and a2: [Int]) -> Int {

        let array1 = a1.sorted()
        let array2 = a2.sorted()

        var i1 = 0
        var i2 = 0
        var difference = Int.max

        while (array1.count > i1 && array2.count > i2) {

            let tmp = abs(array1[i1] - array2[i2])

            if  tmp < difference {
                difference = tmp
            }
            
            if array1[i1] < array2[i2] {
                i1 += 1
            } else {
                i2 += 1
            }
        }
        
        return difference
    }
    
    
   // print(getMaxDifference(between: a1, and: a2))
}
