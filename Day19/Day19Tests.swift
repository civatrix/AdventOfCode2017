//
//  Day19Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day19Tests: XCTestCase {
    let day = Day19()
    
    func testDay() throws {
        let input =
"""
     |
     |  +--+
     A  |  C
 F---|----E|--+
     |  |  |  D
     +B-+  +--+
"""
        XCTAssertEqual(day.run(input: input), "38")
    }
}
