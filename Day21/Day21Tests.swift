//
//  Day21Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day21Tests: XCTestCase {
    let day = Day21()
    
    func testDay() throws {
        let input =
"""
../.# => ##./#../...
.#./..#/### => #..#/..../..../#..#
"""
        day.iterations = 2
        XCTAssertEqual(day.run(input: input), "12")
    }
    
    func testMirrorHorizontal2() {
        let input =
"""
.#
##
""".parseGrid()
        let output =
"""
#.
##
""".parseGrid()
        XCTAssertEqual(input.mirrorHorizontally(2), output)
    }
    
    func testMirrorHorizontal3() {
        let input =
"""
.#.
..#
###
""".parseGrid()
        let output =
"""
.#.
#..
###
""".parseGrid()
        XCTAssertEqual(input.mirrorHorizontally(3), output)
    }
    
    func testMirrorVertical2() {
        let input =
"""
.#
##
""".parseGrid()
        let output =
"""
##
.#
""".parseGrid()
        XCTAssertEqual(input.mirrorVertically(2), output)
    }
    
    func testMirrorVertical3() {
        let input =
"""
.#.
..#
###
""".parseGrid()
        let output =
"""
###
..#
.#.
""".parseGrid()
        XCTAssertEqual(input.mirrorVertically(3), output)
    }
    
    func testRotateClockwise2() {
        let input =
"""
.#
#.
""".parseGrid()
        let output =
"""
#.
.#
""".parseGrid()
        XCTAssertEqual(input.rotateClockwise(2), output)
    }
    
    func testRotateClockwise3() {
        let input =
"""
.#.
..#
###
""".parseGrid()
        let output =
"""
#..
#.#
##.
""".parseGrid()
        print(input.rotateClockwise(3))
        print(output)
        XCTAssertEqual(input.rotateClockwise(3), output)
    }
    
    func testRotateCounterclockwise2() {
        let input =
"""
.#
#.
""".parseGrid()
        let output =
"""
#.
.#
""".parseGrid()
        XCTAssertEqual(input.rotateCounterclockwise(2), output)
    }
    
    func testRotateCounterclockwise3() {
        let input =
"""
.#.
..#
###
""".parseGrid()
        let output =
"""
.##
#.#
..#
""".parseGrid()
        XCTAssertEqual(input.rotateCounterclockwise(3), output)
    }
}
