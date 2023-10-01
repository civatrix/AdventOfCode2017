//
//  Day14.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day14: Day {
    func run(input: String) -> String {
        var used = 0
        for line in 0 ..< 128 {
            let hash = hash("\(input)-\(line)")
                .map { UInt8(exactly: $0.hexDigitValue!)! }
            for char in hash {
                for column in 0 ..< 4 {
                    if char & (1 << column) > 0 {
                        used += 1
                    }
                }
            }
        }
        
        return used.description
    }
    
    func hash(_ string: String) -> String {
        return Day10().run(input: string)
    }
}
