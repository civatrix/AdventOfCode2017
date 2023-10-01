//
//  Day10.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day10: Day {
    var loopSize = 256
    
    func run(input: String) -> String {
        var loop = (0 ..< loopSize).map { $0 }
        
        var current = 0
        var skip = 0
        for length in input.allDigits {
            loop.rotate(toStartAt: current)
            let range = 0 ..< length
            let reversed = loop[range].reversed()
            loop[range] = ArraySlice(reversed)
            loop.rotate(toStartAt: loopSize - current)
            
            current += (length + skip)
            current %= loopSize
            skip += 1
        }
        
        return (loop[0] * loop[1]).description
    }
}
