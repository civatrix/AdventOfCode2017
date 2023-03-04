//
//  Day3Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day3Tests: XCTestCase {
    let day = Day3()
    
    func testDay() throws {
        let input =
"""
1
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay2() throws {
        let input =
"""
12
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay3() throws {
        let input =
"""
23
"""
        XCTAssertEqual(day.run(input: input), "2")
    }
    
    func testDay4() throws {
        let input =
"""
1024
"""
        XCTAssertEqual(day.run(input: input), "31")
    }
}
