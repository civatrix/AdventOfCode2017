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
            .map { $0.max()! - $0.min()! }
            .sum
            .description
    }
}
