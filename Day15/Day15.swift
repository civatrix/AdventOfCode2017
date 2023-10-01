//
//  Day15.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day15: Day {
    func run(input: String) -> String {
        let start = input.allDigits
        let mask = (1 << 16) - 1
        
        var a = start[0]
        var b = start[1]
        
        var matches = 0
        for _ in 0 ..< 40_000_000 {
            a = (a * 16807) % 2147483647
            b = (b * 48271) % 2147483647
            
            if (a & mask) == (b & mask) {
                matches += 1
            }
        }
        
        return matches.description
    }
}
