//
//  Day1Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day1Tests: XCTestCase {
    let day = Day1()
    
    func testDay() throws {
        let input =
"""
1122
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay2() throws {
        let input =
"""
1111
"""
        XCTAssertEqual(day.run(input: input), "4")
    }
    
    func testDay3() throws {
        let input =
"""
1234
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay4() throws {
        let input =
"""
91212129
"""
        XCTAssertEqual(day.run(input: input), "9")
    }
}
