//
//  Day16.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day16: Day {    
    var dancers: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"]
    
    func run(input: String) -> String {
        for move in input.split(separator: ",") {
            switch move.first {
            case "s":
                dancers.rotate(toStartAt: dancers.count - move.allDigits[0])
            case "x":
                dancers.swapAt(move.allDigits[0], move.allDigits[1])
            case "p":
                dancers.swapAt(dancers.firstIndex(of: move.dropFirst().first!)!, dancers.firstIndex(of: move.last!)!)
            default:
                fatalError("Unrecognized move \(move)")
            }
        }
        
        return String(dancers)
    }
}
