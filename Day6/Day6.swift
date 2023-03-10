//
//  Day6.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day6: Day {
    func run(input: String) -> String {
        var blocks = input.allDigits
        var seen = [[Int]]()
        
        var redistribution = 0
        while !seen.contains(blocks) {
            seen.append(blocks)
            var largest = blocks.max()!
            let largestIndex = blocks.firstIndex(of: largest)!
            
            blocks[largestIndex] = 0
            var steps = largestIndex + 1
            while largest > 0 {
                blocks[steps % blocks.count] += 1
                steps += 1
                largest -= 1
            }
            
            redistribution += 1
        }
        
        return (redistribution - seen.firstIndex(of: blocks)!).description
    }
}
