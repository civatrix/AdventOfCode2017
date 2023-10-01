//
//  Day13.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day13: Day {
    func run(input: String) -> String {
        let scanners = [Int: Int](uniqueKeysWithValues: input.lines.map { $0.allDigits }.map { ($0[0], $0[1]) })
        let maxDepth = scanners.keys.max()!
        
        for delay in 0 ... .max {
            var found = false
            for depth in 0 ... maxDepth {
                guard let range = scanners[depth] else {
                    continue
                }
                
                if (depth + delay) % (2 * (range - 1)) == 0 {
                    found = true
                    break
                }
            }
            
            if !found {
                return delay.description
            }
        }
        fatalError("No solution found")
    }
}
