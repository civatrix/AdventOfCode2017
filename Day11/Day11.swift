//
//  Day11.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day11: Day {
    func run(input: String) -> String {
        let target: HexPoint = input
            .split(separator: ",")
            .map {
                return switch $0 {
                case "n": .n
                case "ne": .ne
                case "nw": .nw
                case "s": .s
                case "se": .se
                case "sw": .sw
                default:
                    fatalError("Unknown direction \($0)")
                }
            }
            .reduce(HexPoint.zero, +)
        
        return target.distance(to: .zero).description
    }
}
