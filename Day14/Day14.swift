//
//  Day14.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day14: Day {
    func run(input: String) -> String {
        var used = Set<Point>()
        for line in 0 ..< 128 {
            let hash = hash("\(input)-\(line)")
                .map { UInt8(exactly: $0.hexDigitValue!)! }
            for (index, char) in hash.enumerated() {
                for column in 0 ..< 4 {
                    if char & (1 << column) > 0 {
                        used.insert([(index * 4) + (3 - column), line])
                    }
                }
            }
        }
        
        var regions = 0
        while let root = used.popFirst() {
            regions += 1
            var toExplore = Set<Point>([root])
            while let next = toExplore.popFirst() {
                let validNeighbors = used.intersection(next.adjacent)
                toExplore.formUnion(validNeighbors)
                used.subtract(validNeighbors)
            }
        }
        
        return regions.description
    }
    
    func hash(_ string: String) -> String {
        return Day10().run(input: string)
    }
}
