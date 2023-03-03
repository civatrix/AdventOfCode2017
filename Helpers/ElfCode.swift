//
//  ElfCode.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-12-10.
//

import Foundation
import RegexBuilder

class ElfCode {
    static let regex = Regex {
        Capture {
            One(.word)
            One(.word)
            One(.word)
        }
        " "
        Capture {
            Optionally {
                "-"
            }
            OneOrMore(.word)
        }
        Optionally {
            " "
            Capture {
                Optionally {
                    "-"
                }
                OneOrMore(.word)
            }
        }
    }
    
    enum Instruction {
        case copy(Substring, Substring), increment(Substring), decrement(Substring), jumpNonZero(Substring, Substring), toggle(Substring), output(Substring)
        
        init(_ input: String) {
            guard let match = input.wholeMatch(of: regex)?.output else {
                fatalError("Unknown instruction: \(input)")
            }
            let instruction = match.1
            switch instruction {
            case "cpy": self = .copy(match.2, match.3!)
            case "inc": self = .increment(match.2)
            case "dec": self = .decrement(match.2)
            case "jnz": self = .jumpNonZero(match.2, match.3!)
            case "tgl": self = .toggle(match.2)
            case "out": self = .output(match.2)
            default:
                fatalError("Unknown instruction: \(input)")
            }
        }
    }
    
    var registers: [Substring: Int] = ["a": 1, "b": 0, "c": 0, "d": 0]
    var instructions: [Instruction]
    var instructionPointer = 0
    var output = ""
    
    init(_ lines: [String]) {
        instructions = lines.map(Instruction.init)
    }
    
    func run() -> Int {
        while step() {}
        return registers["a"]!
    }
    
    func step() -> Bool {
        let instruction = instructions[instructionPointer]
        switch instruction {
        case let .copy(lhs, rhs):
            if let number = Int(lhs) {
                registers[rhs] = number
            } else {
                registers[rhs] = registers[lhs]!
            }
        case let .increment(register):
            registers[register]! += 1
        case let .decrement(register):
            registers[register]! -= 1
        case let .jumpNonZero(register, value):
            if (Int(register) ?? registers[register])! != 0, let offset = Int(value) ?? registers[value] {
                instructionPointer += offset - 1
            }
        case let .toggle(register):
            let offset = registers[register]!
            guard let target = instructions[safe: instructionPointer + offset] else { break }
            switch target {
            case let .copy(lhs, rhs):
                instructions[instructionPointer + offset] = .jumpNonZero(lhs, rhs)
            case let .increment(rhs):
                instructions[instructionPointer + offset] = .decrement(rhs)
            case let .decrement(rhs):
                instructions[instructionPointer + offset] = .increment(rhs)
            case let .jumpNonZero(lhs, rhs):
                instructions[instructionPointer + offset] = .copy(lhs, rhs)
            case let .toggle(rhs):
                instructions[instructionPointer + offset] = .increment(rhs)
            case let .output(rhs):
                instructions[instructionPointer + offset] = .increment(rhs)
            }
            case let .output(register):
            output += "\((Int(register) ?? registers[register])!)"
        }
        
        instructionPointer += 1
        return instructionPointer < instructions.count
    }
}
