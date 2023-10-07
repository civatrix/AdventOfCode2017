//
//  Day17.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day17: Day {
    func run(input: String) -> String {
        let steps = Int(input)!
        var size = 1
        var current = 0
        var target = 0
        
        for next in 1 ... 50_000_000 {
            let nextIndex = (current + steps) % size + 1
            if nextIndex == 1 {
                target = next
            }
            current = nextIndex
            size += 1
        }
        
        return target.description
    }
}
