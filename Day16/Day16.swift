//
//  Day16.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day16: Day {    
    enum Move {
        case spin(index: Int)
        case exchange(lhs: Int, rhs: Int)
        case partner(lhs: Character, rhs: Character)
        
        init(_ input: Substring) {
            switch input.first {
            case "s":
                self = .spin(index: input.allDigits[0])
            case "x":
                self = .exchange(lhs: input.allDigits[0], rhs: input.allDigits[1])
            case "p":
                self = .partner(lhs: input.dropFirst().first!, rhs: input.last!)
            default:
                fatalError("Unrecognized move \(input)")
            }
        }
    }
    
    var dancers = "abcdefghijklmnop".map { $0 }
    
    func run(input: String) -> String {
        let moves = input.split(separator: ",").map(Move.init)
        
        var statesSeen = [[Character]: Int]()
        var iteration = 0
        while iteration < 1_000_000_000 {
            if let lastSeen = statesSeen[dancers] {
                let cycleSize = iteration - lastSeen
                iteration = lastSeen + ((1_000_000_000 / cycleSize) * cycleSize)
                statesSeen = [:]
            }
            statesSeen[dancers] = iteration
            
            for move in moves {
                switch move {
                case let .spin(index):
                    dancers.rotate(toStartAt: dancers.count - index)
                case let .exchange(lhs: lhs, rhs: rhs):
                    dancers.swapAt(lhs, rhs)
                case let .partner(lhs: lhs, rhs: rhs):
                    dancers.swapAt(dancers.firstIndex(of: lhs)!, dancers.firstIndex(of: rhs)!)
                }
            }
            iteration += 1
        }
        
        return String(dancers)
    }
}
