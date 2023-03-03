//
//  Day2.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day2: Day {
    func run(input: String) -> String {
        return input.lines
            .map { $0.allDigits }
            .map { $0.permutations(ofCount: 2).first { $0[0].isMultiple(of: $0[1]) || $0[1].isMultiple(of: $0[0]) }! }
            .map { $0.max()! / $0.min()! }
            .sum
            .description
    }
}
