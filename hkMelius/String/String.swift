//
//  String.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 31/10/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation


extension String {
    
    enum Mode {
        case buffered
        case nonBuffered
    }
    
    func isUnique(mode: Mode) -> Bool {
        
        return mode == .buffered ? checkIsUniqueBuffered() : checkIsUniqueNonBuffered()
    }
    
    func firstNotRepeatingCharacter(s: String) -> Character {
        
        
        return "_"
    }
    
    private func checkIsUniqueNonBuffered() -> Bool {
        
        for i in self.characters {
            
            var hasFound = false
            
            for j in self.characters {
                if i == j {
                    if hasFound == false {
                        hasFound = true
                    } else {
                        return false
                    }
                }
            }
            
            hasFound = false
        }
        
        return true
    }
    
    private func checkIsUniqueBuffered() -> Bool {
        
        var buffer = [Character]()
        
        for i in self.characters {
            
            if buffer.contains(where: { $0 == i}) {
                return false
            }
            
            buffer.append(i)
        }
        
        return true
    }

    func commonCharacterCount(s1: String, s2: String) -> Int {


        var s1 = s1
        var count = 0
        for char in s2.characters {
            if let index = s1.characters.index(of: char) {
                s1.remove(at: index)
                count += 1
            }
        }
        return count
    }

    func isVariableNamePattern(name: String) -> Bool {
        let pat = "^[a-zA-Z_][a-zA-Z0-9_]*$"
        let regex = try! NSRegularExpression(pattern: pat, options: [])
        let matches = regex.matches(in: name, options: [], range: NSRange(location: 0, length: name.characters.count))
        return matches.count == 1
    }
}
