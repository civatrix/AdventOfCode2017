//
//  Day3.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day3: Day {
    func run(input: String) -> String {
        let target = Int(input)!
        
        var map = [Point: Int]()
        var position = Point.zero
        var direction = Point.right
        var lengthOfSide = 1
        var stepsToTake = lengthOfSide
        var hasRotated = false
        var lastCalculated = 1
        while lastCalculated <= target {
            map[position] = lastCalculated
            position += direction
            lastCalculated = position.neighbours.compactMap { map[$0] }.sum
            stepsToTake -= 1
            if stepsToTake == 0 {
                direction = direction.rotate(clockwise: false)
                if hasRotated {
                    hasRotated = false
                    lengthOfSide += 1
                } else {
                    hasRotated = true
                }
                stepsToTake = lengthOfSide
            }
        }
        
        return lastCalculated.description
    }
}
