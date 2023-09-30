//
//  Day8.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day8: Day {
    func run(input: String) -> String {
        var registers = [Substring: Int]()
        
        for line in input.lines {
            let words = line.split(separator: " ")
            let comparator = words[5]
            let lhs = words[4]
            let rhs = Int(words[6])!
            
            let passed: Bool
            switch comparator {
            case "==":
                passed = registers[lhs, default: 0] == rhs
            case ">":
                passed = registers[lhs, default: 0] > rhs
            case ">=":
                passed = registers[lhs, default: 0] >= rhs
            case "<":
                passed = registers[lhs, default: 0] < rhs
            case "<=":
                passed = registers[lhs, default: 0] <= rhs
            case "!=":
                passed = registers[lhs, default: 0] != rhs
            default:
                fatalError("Unrecognized comparator: \(comparator) in \(line)")
            }
            
            guard passed else { continue }
            let sign = (words[1] == "inc") ? 1 : -1
            registers[words[0], default: 0] += sign * Int(words[2])!
        }
        
        return registers.values.max()!.description
    }
}
