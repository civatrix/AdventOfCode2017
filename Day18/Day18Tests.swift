//
//  Day18Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day18Tests: XCTestCase {
    let day = Day18()
    
    func testDay() throws {
        let input =
"""
set a 1
add a 2
mul a a
mod a 5
snd a
set a 0
rcv a
jgz a -1
set a 1
jgz a -2
"""
        XCTAssertEqual(day.run(input: input), "4")
    }
}
