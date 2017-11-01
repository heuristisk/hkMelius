//
//  Permutation.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 01/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

extension String {
    
    func getPermutations() -> Set<String> {
        
        guard self.characters.count > 0 else {
            return []
        }
        
        guard self.characters.count != 1 else {
            return [self]
        }
        
        let index = self.index(before: self.endIndex)
        let allCharsExceptLast = self.substring(to: index)
        let lastChar = self.characters.last!
        
        // recursive call: get all possible permutations for all chars except last
        let permutationsOfAllCharsExceptLast = allCharsExceptLast.getPermutations()
        
        // put the last char in all possible positions for each of the above permutations
        var permutations: [String] = []
        for permutationOfAllCharsExceptLast in permutationsOfAllCharsExceptLast {
            for position in 0...allCharsExceptLast.characters.count {
                let startIndex = permutationOfAllCharsExceptLast.startIndex
                let index = permutationOfAllCharsExceptLast.index(startIndex, offsetBy: position)
                let permutation = permutationOfAllCharsExceptLast.substring(to: index) + String(lastChar)
                    + permutationOfAllCharsExceptLast.substring(from: index)
                permutations.append(permutation)
            }
        }
        
        return Set(permutations)
    }
}
