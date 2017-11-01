//
//  Recursion.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation


class Coin {
    
    static  func total(_ amount: Int,_ coins: [Int],_ index: Int) -> Int {
        if (amount < 0) {
            return 0;
        }
        if (amount == 0) {
            return 1;
        }
        
        if (index == coins.count  && amount > 0) {
            return 0;
        }
        
        return total(amount - coins[index], coins, index) + total(amount, coins, index + 1);
    }
}

public extension String {
    
    func substring(_ r: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        return self.substring(with: Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex)))
    }
}

class Back­track­ing {
    
    static func wordBreak(phrase: String, dictionary: [String], output: String) -> (isPossible: Bool, output: String?) {
        
        if phrase.characters.count == 0 {
            return (true,output)
        } else {
            var index = 0;
            var word = "";
            while (index < phrase.characters.count) {
                word += phrase.characters.map({ String($0) })[index]
                
                if (dictionary.contains(word)) {
                    
                    let result = wordBreak(phrase: phrase.substring((index+1)..<phrase.characters.count),
                                           dictionary:  dictionary,
                                           output:  "\(output)\(word) ")
                    
                    if result.isPossible {
                        return (true,result.output);
                    } else {
                        index += 1
                    }
                } else {
                    index += 1
                }
            }
            
            return (false,nil)
        }
    }
}
