//
//  Day1.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day1: Day {
    func run(input: String) -> String {
        let circle = input.map { $0 }
        let radii = circle.count / 2
        return (0 ..< radii).map { circle[$0] == circle[$0 + radii] ? circle[$0].wholeNumberValue! * 2 : 0 }.sum.description
    }
}
