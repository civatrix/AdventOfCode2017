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
        var buffer = [0]
        var current = 0
        
        for next in 1 ... 2017 {
            let nextIndex = (current + steps) % buffer.count + 1
            buffer.insert(next, at: nextIndex)
            current = nextIndex
        }
        
        return buffer[wrapped: current + 1].description
    }
}
