//
//  Int.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 07/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Inteiro {

    func isLucky(n: Int) -> Bool {

        let allDigits = String(n).utf8.map{Int($0)}
        let half = allDigits.count/2
        let p1 = allDigits[0..<half].reduce(0,+)
        let p2 = allDigits[half..<allDigits.count].reduce(0,+)
        return p1 == p2
    }
    
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

    func mapDecoding(message: String) -> Int {

        var prev = 0
        var count = 0
        var curr = 1
        let array = Array(message.utf8.map({Int($0) - 48}))

        for i in 0 ..< array.count {
            let digit = array[i]
            var number = 0

            if i > 0 {
                number = array[i - 1] * 10 + digit;
            }

            if digit > 0 {
                count = curr
            }

            if number <= 26 && number > 9 {
                count += prev
            }
            
            prev = curr;
            curr = count % 1000000007;
            count = 0;
        }
        
        return curr
    }
    
    

}
