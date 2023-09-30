//
//  Day9.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day9: Day {
    func run(input: String) -> String {
        var score = 0
        
        var isGarbage = false
        var skipNext = false
        var depth = 0
        for character in input {
            if skipNext {
                skipNext = false
                continue
            }
            if isGarbage && (character != ">" && character != "!") {
                continue
            }
            switch character {
            case "{":
                depth += 1
            case "}":
                score += depth
                depth -= 1
            case "<":
                isGarbage = true
            case ">":
                isGarbage = false
            case "!":
                skipNext = true
            default: continue
            }
        }
        
        return score.description
    }
}
