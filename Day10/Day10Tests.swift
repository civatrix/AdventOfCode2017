//
//  Day10Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day10Tests: XCTestCase {
    let day = Day10()
    
    func testDay() throws {
        let input =
"""
3, 4, 1, 5
"""
        day.loopSize = 5
        XCTAssertEqual(day.run(input: input), "12")
    }
}
