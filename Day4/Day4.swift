//
//  Day4.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day4: Day {
    func run(input: String) -> String {
        input.lines.filter { Set($0.split(separator: " ")).count == $0.split(separator: " ").count }.count.description
    }
}
