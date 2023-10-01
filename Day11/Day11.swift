//
//  Day11.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day11: Day {
    func run(input: String) -> String {
        let path: [HexPoint] = input
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
        
        var maxDistance = Int.min
        var position = HexPoint.zero
        for step in path {
            position += step
            maxDistance = max(maxDistance, position.distance(to: .zero))
        }
        
        return maxDistance.description
    }
}
