//
//  Day1.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day1: Day {
    func run(input: String) -> String {
        let circle = input.map { $0 } + [input.last!]
        return circle.adjacentPairs().map { $0.0 == $0.1 ? $0.0.wholeNumberValue! : 0 }.sum.description
    }
}
