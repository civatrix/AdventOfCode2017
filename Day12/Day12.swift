//
//  Day12.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day12: Day {
    func run(input: String) -> String {
        let map = [Int: [Int]](uniqueKeysWithValues: input.lines.map {
            let numbers = $0.allDigits
            return (numbers[0], Array(numbers.dropFirst()))
        })
        
        var allIds = Set(map.keys)
        var sets = 0
        
        while let root = allIds.popFirst() {
            sets += 1
            var toExplore = Set([root])
            var connected = Set<Int>()
            
            while let next = toExplore.popFirst() {
                allIds.remove(next)
                connected.insert(next)
                toExplore.formUnion(map[next,default: []])
                toExplore.subtract(connected)
            }
        }
        
        return sets.description
    }
}
