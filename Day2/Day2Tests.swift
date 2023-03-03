//
//  Day2Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day2Tests: XCTestCase {
    let day = Day2()
    
    func testDay() throws {
        let input =
"""
5 1 9 5
7 5 3
2 4 6 8
"""
        XCTAssertEqual(day.run(input: input), "18")
    }
}
