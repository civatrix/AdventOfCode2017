//
//  Day7.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation
import RegexBuilder

struct Platter {
    let name: Substring
    let weight: Int
    let children: [Substring]
    
    init(line: String) {
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
        
        let match = line.wholeMatch(of: regex)!
        self.name = match[name]
        self.weight = match[weight]
        self.children = match.output.3 ?? []
    }
    
    func totalWeight(_ directory: [Substring: Platter]) -> Int {
        return weight + children.map { directory[$0]!.totalWeight(directory) }.sum
    }
}

final class Day7: Day {
    func run(input: String) -> String {
        let platters = input.lines.map(Platter.init(line:))
        let directory = Dictionary(uniqueKeysWithValues: platters.map { ($0.name, $0) })
        
        let heads = Set(platters.map { $0.name })
        let tails = Set(platters.flatMap { $0.children })
        let root = directory[heads.subtracting(tails).first!]!
        return process(root: root, directory)!.description
    }
    
    func process(root: Platter, _ directory: [Substring: Platter]) -> Int? {
        let rootWeights = root.children.map { directory[$0]!.totalWeight(directory) }
        let weightCounts = rootWeights.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
        let brokenIndex: Int
        let correctIndex: Int
        if let firstWrong = weightCounts.first(where: { $0.value == 1 })?.key {
            brokenIndex = rootWeights.firstIndex(of: firstWrong)!
            correctIndex = brokenIndex == 0 ? 1 : 0
        } else {
            return nil
        }
        
        if let answer = process(root: directory[root.children[brokenIndex]]!, directory) {
            return answer
        } else {
            return directory[root.children[brokenIndex]]!.weight - abs(rootWeights[correctIndex] - rootWeights[brokenIndex])
        }
    }
}
