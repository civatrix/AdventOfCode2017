//
//  Day9Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day9Tests: XCTestCase {
    let day = Day9()
    
    func testDay1() throws {
        let input =
"""
<>
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay2() throws {
        let input =
"""
<random characters>
"""
        XCTAssertEqual(day.run(input: input), "17")
    }
    
    func testDay3() throws {
        let input =
"""
<<<<>
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
    
    func testDay4() throws {
        let input =
"""
<{!>}>
"""
        XCTAssertEqual(day.run(input: input), "2")
    }
    
    func testDay5() throws {
        let input =
"""
<!!>
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay6() throws {
        let input =
"""
<!!!>>
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
    
    func testDay7() throws {
        let input =
"""
<{o"i!a,<{i<a>
"""
        XCTAssertEqual(day.run(input: input), "10")
    }
}
