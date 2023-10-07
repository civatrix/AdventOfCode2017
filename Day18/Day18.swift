//
//  Day18.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day18: Day {
    func run(input: String) -> String {
        let elfCode = ElfCode(input.lines)
        
        while elfCode.step() { }
        return elfCode.output
    }
}
