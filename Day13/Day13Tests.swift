//
//  Day13Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day13Tests: XCTestCase {
    let day = Day13()
    
    func testDay() throws {
        let input =
"""
0: 3
1: 2
4: 4
6: 4
"""
        XCTAssertEqual(day.run(input: input), "24")
    }
}
