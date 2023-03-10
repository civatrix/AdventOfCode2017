//
//  Day5.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day5: Day {
    func run(input: String) -> String {
        var jumps = input.allDigits
        var index = 0
        
        var steps = 0
        while index < jumps.count || index < 0 {
            let previousIndex = index
            index += jumps[index]
            jumps[previousIndex] += jumps[previousIndex] >= 3 ? -1 : 1
            steps += 1
        }
        
        return steps.description
    }
}
