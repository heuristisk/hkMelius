//
//  main.swift
//  CrackingTheCodingInterview
//
//  Created by Anderson Santos Gusmao on 07/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

print("Hello, World!")

func reverseParentheses(s: String) -> String {

    var s = s

    if let a = s.range(of: "(") {
        s =  s.substring(to: a.lowerBound) + reverseParentheses(s: s.substring(from: a.upperBound))
        print(s)
    }

    if let b = s.range(of: ")") {
        s =  String(s.substring(to: b.lowerBound).characters.reversed()) + s.substring(from: b.upperBound)
    }

    return s
}


var s = "Code(Cha(lle)nge)"
reverseParentheses(s: s)
//print("CodeegnlleahC")
