//
//  Day18Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day18Tests: XCTestCase {
    let day = Day18()
    
    func testDay() throws {
        let input =
"""
snd 1
snd 2
snd p
rcv a
rcv b
rcv c
rcv d
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
