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
        let codes = input.map { Int($0.asciiValue!) } + [17, 31, 73, 47, 23]
        var loop = (0 ..< loopSize).map { $0 }
        
        var current = 0
        var skip = 0
        for _ in 0 ..< 64 {
            for length in codes {
                loop.rotate(toStartAt: current)
                let range = 0 ..< length
                let reversed = loop[range].reversed()
                loop[range] = ArraySlice(reversed)
                loop.rotate(toStartAt: loopSize - current)
                
                current += (length + skip)
                current %= loopSize
                skip += 1
            }
        }
        
        return loop
            .map { UInt8(exactly: $0)! }
            .chunks(ofCount: 16).map { chunk in chunk.reduce(0) { $0 ^ $1 } }
            .map { String($0, radix: 16, uppercase: true) }
            .joined()
    }
}
