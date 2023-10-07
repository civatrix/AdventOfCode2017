//
//  Day18.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day18: Day {
    func run(input: String) -> String {
        let bot0 = ElfCode(input.lines)
        let bot1 = ElfCode(input.lines)
        bot1.registers["p"] = 1
        
        var deadlocked = false
        while !deadlocked {
            deadlocked = true
            while bot0.step() {
                deadlocked = false
                if let output = bot0.output {
                    bot1.input.append(output)
                }
            }
            while bot1.step() {
                deadlocked = false
                if let output = bot1.output {
                    bot0.input.append(output)
                }
            }
        }
        
        return bot1.timesSent.description
    }
}
