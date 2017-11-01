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
}
