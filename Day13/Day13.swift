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
        
        var severity = 0
        for depth in 0 ... maxDepth {
            guard let range = scanners[depth] else {
                continue
            }
            
            if depth % (2 * (range - 1)) == 0 {
                severity += depth * range
            }
        }
        return severity.description
    }
}
