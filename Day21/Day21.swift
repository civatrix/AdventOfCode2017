//
//  Day21.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

struct Rule: Hashable {
    let rule: Set<Point>
    let size: Int
}

final class Day21: Day {
    var iterations = 18
    var rules = [Rule: Set<Point>]()
    
    func run(input: String) -> String {
        let grid =
"""
.#.
..#
###
""".parseGrid()
        
        for rule in input.lines {
            let string = rule.replacing("/", with: "\n").split(separator: " => ")
            
            let size = string[0].count == 5 ? 2 : 3
            let lhs = string[0].parseGrid()
            let rhs = string[1].parseGrid()
            
            rules[Rule(rule: lhs, size: size)] = rhs
            rules[Rule(rule: lhs.rotateClockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.rotateCounterclockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.rotateClockwise(size).rotateClockwise(size), size: size)] = rhs
            
            rules[Rule(rule: lhs.mirrorHorizontally(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorHorizontally(size).rotateClockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorHorizontally(size).rotateCounterclockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorHorizontally(size).rotateClockwise(size).rotateClockwise(size), size: size)] = rhs
            
            rules[Rule(rule: lhs.mirrorVertically(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorVertically(size).rotateClockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorVertically(size).rotateCounterclockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorVertically(size).rotateClockwise(size).rotateClockwise(size), size: size)] = rhs
            
            rules[Rule(rule: lhs.mirrorHorizontally(size).mirrorVertically(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorHorizontally(size).mirrorVertically(size).rotateClockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorHorizontally(size).mirrorVertically(size).rotateCounterclockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorHorizontally(size).mirrorVertically(size).rotateClockwise(size).rotateClockwise(size), size: size)] = rhs
            
            rules[Rule(rule: lhs.mirrorVertically(size).mirrorHorizontally(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorVertically(size).mirrorHorizontally(size).rotateClockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorVertically(size).mirrorHorizontally(size).rotateCounterclockwise(size), size: size)] = rhs
            rules[Rule(rule: lhs.mirrorVertically(size).mirrorHorizontally(size).rotateClockwise(size).rotateClockwise(size), size: size)] = rhs
        }
        
        var total = [grid: 1]
        for _ in 0 ..< iterations / 3 {
            let temp = total
            total = [:]
            for seed in temp {
                for (key, value) in iterate(seed.key) {
                    total[key, default: 0] += value * seed.value
                }
            }
        }
        
        return total.map { $0.key.count * $0.value }.sum.description
    }
    
    var cache = [Set<Point>: [Set<Point>: Int]]()
    func iterate(_ seed: Set<Point>) -> [Set<Point>: Int] {
        if let cacheHit = cache[seed] {
            return cacheHit
        }
        
        var grid = seed
        var gridSize = 3
        var elementSize = 3
        for _ in 0 ..< 3 {
            var newGrid = Set<Point>()
            for xOffset in (0 ..< gridSize).striding(by: elementSize) {
                for yOffset in (0 ..< gridSize).striding(by: elementSize) {
                    let partialGrid = grid
                        .filter { (xOffset ..< xOffset + elementSize).contains($0.x) && (yOffset ..< yOffset + elementSize).contains($0.y) } // Get points in the current section
                        .map { Point(x: $0.x - xOffset, y: $0.y - yOffset) } // Remap them so they match our rules dictionary
                    let resolvedGrid = rules[Rule(rule: Set(partialGrid), size: elementSize)]! // Get result
                        .map { Point(x: $0.x + xOffset + (xOffset / elementSize), y: $0.y + yOffset + (yOffset / elementSize)) } // Remap back to the current section
                    assert(newGrid.intersection(resolvedGrid).isEmpty) // There should never be overlap between new elements and existing grid
                    newGrid.formUnion(resolvedGrid)
                }
            }
            
            grid = newGrid
            gridSize = (gridSize / elementSize) * (elementSize + 1)
            elementSize = gridSize.isMultiple(of: 2) ? 2 : 3
        }
        
        var output = [Set<Point>: Int]()
        for xOffset in (0 ..< 9).striding(by: 3) {
            for yOffset in (0 ..< 9).striding(by: 3) {
                let partialGrid = grid
                    .filter { (xOffset ..< xOffset + elementSize).contains($0.x) && (yOffset ..< yOffset + elementSize).contains($0.y) } // Get points in the current section
                    .map { Point(x: $0.x - xOffset, y: $0.y - yOffset) } // Remap them so they match our rules dictionary
                output[Set(partialGrid), default: 0] += 1
            }
        }
        
        cache[seed] = output
        return output
    }
}

extension Set<Point> {
    func mirrorHorizontally(_ size: Int) -> Set<Point> {
        Set(map { [-($0.x + 1) + size, $0.y] })
    }
    
    func mirrorVertically(_ size: Int) -> Set<Point> {
        Set(map { [$0.x, -($0.y + 1) + size] })
    }
    
    func rotateClockwise(_ size: Int) -> Set<Point> {
        let modifier = size == 2 ? 1 : 2
        return Set(map { [-$0.y + modifier, $0.x] })
    }
    
    func rotateCounterclockwise(_ size: Int) -> Set<Point> {
        let modifier = size == 2 ? 1 : 2
        return Set(map { [$0.y, -$0.x + modifier] })
    }
}
