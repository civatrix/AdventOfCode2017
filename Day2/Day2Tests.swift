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
5 9 2 8
9 4 7 3
3 8 6 5
"""
        XCTAssertEqual(day.run(input: input), "9")
    }
}
