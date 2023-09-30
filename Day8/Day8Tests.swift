//
//  Day8Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day8Tests: XCTestCase {
    let day = Day8()
    
    func testDay() throws {
        let input =
"""
b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10
"""
        XCTAssertEqual(day.run(input: input), "10")
    }
}
