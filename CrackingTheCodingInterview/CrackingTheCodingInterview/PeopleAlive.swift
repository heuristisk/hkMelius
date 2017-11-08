//
//  PeopleAlive.swift
//  CrackingTheCodingInterview
//
//  Created by Anderson Santos Gusmao on 08/11/17.
//  Copyright © 2017 Heuristisk. All rights reserved.
//

import Foundation

class PeopleAlive {

    struct Person {
        var birthYear: Int
        var deathYear: Int
    }


    let population = [
        Person(birthYear: 1900, deathYear: 1976),
        Person(birthYear: 1910, deathYear: 1975),
        Person(birthYear: 1971, deathYear: 2015),


        ]


    func getMinMaxYear(population: [Person]) -> (min: Int, max: Int){

        let min = population.min(by: {$0.birthYear < $1.birthYear})?.birthYear
        let max = population.max(by: {$0.deathYear < $1.deathYear})?.deathYear
        return (min ?? -1, max ?? -1)
    }

    func getDelta(population: [Person]) -> (deltas: [Int], minYear: Int, maxYear: Int) {

        let range = getMinMaxYear(population: population)
        var populationDelta = [Int](repeating: 0, count: (range.max - range.min) + 1)

        for p in population {
            if p.birthYear < p.deathYear {
                populationDelta[p.birthYear - range.min] += 1
            }

            if p.deathYear > p.birthYear {
                populationDelta[p.deathYear - range.min] -= 1
            }
        }

        return (populationDelta, range.min, range.max)
    }

    func getMaxAlive(population: [Person]) -> (year: Int, alive: Int) {

        let result = getDelta(population: population)
        let deltas = result.deltas
        var maxYear = 0
        var maxAlive = 0
        var aliveCounter = 0

        for i in 0 ..< result.maxYear - result.minYear {

            aliveCounter += deltas[i]
            if aliveCounter > maxAlive {
                maxYear =  result.minYear + i
                maxAlive = aliveCounter
            }
        }
        
        return (maxYear, maxAlive)
    }
}

//let result = getMaxAlive(population: population)
//print("On the year of \(result.year) the amount of population was \(result.alive)")
