//
//  Day15Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day15Tests: XCTestCase {
    let day = Day15()
    
    func testDay() throws {
        let input =
"""
Generator A starts with 65
Generator B starts with 8921
"""
        XCTAssertEqual(day.run(input: input), "588")
    }
}
