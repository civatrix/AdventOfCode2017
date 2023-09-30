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
{}
"""
        XCTAssertEqual(day.run(input: input), "1")
    }
    
    func testDay2() throws {
        let input =
"""
{{{}}}
"""
        XCTAssertEqual(day.run(input: input), "6")
    }
    
    func testDay3() throws {
        let input =
"""
{{},{}}
"""
        XCTAssertEqual(day.run(input: input), "5")
    }
    
    func testDay4() throws {
        let input =
"""
{{{},{},{{}}}}
"""
        XCTAssertEqual(day.run(input: input), "16")
    }
    
    func testDay5() throws {
        let input =
"""
{<a>,<a>,<a>,<a>}
"""
        XCTAssertEqual(day.run(input: input), "1")
    }
    
    func testDay6() throws {
        let input =
"""
{{<ab>},{<ab>},{<ab>},{<ab>}}
"""
        XCTAssertEqual(day.run(input: input), "9")
    }
    
    func testDay7() throws {
        let input =
"""
{{<!!>},{<!!>},{<!!>},{<!!>}}
"""
        XCTAssertEqual(day.run(input: input), "9")
    }
    
    func testDay8() throws {
        let input =
"""
{{<a!>},{<a!>},{<a!>},{<ab>}}
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
