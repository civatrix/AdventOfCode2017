//
//  Day16Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day16Tests: XCTestCase {
    let day = Day16()
    
    func testDay() throws {
        let input =
"""
s1,x3/4,pe/b
"""
        day.dancers = ["a", "b", "c", "d", "e"]
        XCTAssertEqual(day.run(input: input), "baedc")
    }
}
