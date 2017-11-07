//
//  PeopleAlive.swift
//  hkMelius
//
//  Created by Anderson Santos Gusmao on 05/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

struct Person {
    var birthYear: Int
    var deathYear: Int
}

class Population {

    var populationAlive = [[Int]]()
    var maxYear = 0
    var minYear = 0

    func calcMostAliveYear(people: [Person]) -> Int {

        initData(people: people)

        for i in minYear ... maxYear {
            
        }

        return -1
    }

    private func initData(people: [Person]) {

        let tmp = people.sorted(by: {$0.birthYear < $1.deathYear})
        minYear = tmp.first!.birthYear
        maxYear = tmp.last!.deathYear

        for i in minYear ... maxYear {
            populationAlive.append([i])
        }
    }


}
