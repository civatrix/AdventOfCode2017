//
//  Day19.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day19: Day {
    func run(input: String) -> String {
        let grid = input.lines.map { $0.map { $0 } }
        var position = Point(x: grid[0].firstIndex(of: "|")!, y: 0)
        var direction = Point.down
        
        var output = 0
        
        while true {
            output += 1
            switch position.value(in: grid) {
            case "+":
                let nextPosition = position.adjacent
                    .filter { $0 != position - direction }
                    .filter { $0.value(in: grid) != nil && $0.value(in: grid) != " " }
                    .first!
                
                direction = nextPosition - position
                position = nextPosition
            case " ", nil:
                return (output - 1).description
            default:
                position += direction
            }
        }
    }
}
