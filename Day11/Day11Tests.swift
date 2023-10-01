//
//  Day11Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day11Tests: XCTestCase {
    let day = Day11()
    
    func testDay() throws {
        let input =
"""
ne,ne,ne
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay2() throws {
        let input =
"""
ne,ne,sw,sw
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay3() throws {
        let input =
"""
ne,ne,s,s
"""
        XCTAssertEqual(day.run(input: input), "2")
    }
    
    func testDay4() throws {
        let input =
"""
se,sw,se,sw,sw
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
