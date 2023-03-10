//
//  Day7.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

final class Day7: Day {
    func run(input: String) -> String {
        let name = Reference<Substring>()
        let weight = Reference<Int>()
        let regex = Regex {
            Capture(as: name) { OneOrMore(.word) }
            " ("
            Capture(as: weight) { OneOrMore(.digit) } transform: { Int($0)! }
            ")"
            Optionally {
                " -> "
                Capture { OneOrMore(.any) } transform: { $0.split(separator: ", ") }
            }
        }
        
        var heads = Set<Substring>()
        var tails = Set<Substring>()
        for line in input.lines {
            let match = line.wholeMatch(of: regex)!
            heads.insert(match[name])
            tails.formUnion(match.output.3 ?? [])
        }
        
        return String(heads.subtracting(tails).first!)
    }
}
