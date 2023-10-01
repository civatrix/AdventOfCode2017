//
//  Day14Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day14Tests: XCTestCase {
    let day = Day14()
    
    func testDay() throws {
        let input =
"""
flqrgnkx
"""
        XCTAssertEqual(day.run(input: input), "1242")
    }
}
