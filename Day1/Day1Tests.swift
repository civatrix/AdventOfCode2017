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
1212
"""
        XCTAssertEqual(day.run(input: input), "6")
    }
    
    func testDay2() throws {
        let input =
"""
123425
"""
        XCTAssertEqual(day.run(input: input), "4")
    }
    
    func testDay3() throws {
        let input =
"""
1221
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay4() throws {
        let input =
"""
123123
"""
        XCTAssertEqual(day.run(input: input), "12")
    }
    
    func testDay5() throws {
        let input =
"""
12131415
"""
        XCTAssertEqual(day.run(input: input), "4")
    }
}
