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
        for character in input {
            if skipNext {
                skipNext = false
                continue
            }
            if isGarbage && (character != ">" && character != "!") {
                score += 1
                continue
            }
            switch character {
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
