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
    


}
