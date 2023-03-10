//
//  Day4.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day4: Day {
    func run(input: String) -> String {
        return input.lines.map { $0.split(separator: " ").map { $0.map { $0 }.sorted() } }
            .filter { Set($0).count == $0.count }
            .count
            .description
    }
}
