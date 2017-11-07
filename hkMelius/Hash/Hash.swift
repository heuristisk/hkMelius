//
//  Hash.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 05/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class Hash {

    func groupingDishes(dishes: [[String]]) -> [[String]] {

        var output = [[String]]()

        let list = detectDishesAndIngredient(dishes: dishes)
        let disheDic = list.filter({$0.value == 1})
        let ingredientDic = list.filter({$0.value >= 2})

        for i in ingredientDic {
            output.append([i.key])
        }

        return output.sorted(by: {$0[0] < $1[0]})
    }

    private func detectDishesAndIngredient(dishes: [[String]]) -> [String: Int] {

        var result = [String: Int]()

        for i in 0 ..< dishes.count {
            for j in 0 ..< dishes[i].count {
                result[dishes[i][j]] = (result[dishes[i][j]] ?? 0) + 1
            }
        }
        
        return result
    }
    
    

}
