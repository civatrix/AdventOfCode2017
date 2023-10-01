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
        
        var toExplore = Set([0])
        var connected = Set<Int>()
        while let next = toExplore.popFirst() {
            connected.insert(next)
            toExplore.formUnion(map[next,default: []])
            toExplore.subtract(connected)
        }
        
        return connected.count.description
    }
}
