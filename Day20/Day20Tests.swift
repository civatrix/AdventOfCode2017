//
//  Day20Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day20Tests: XCTestCase {
    let day = Day20()
    
    func testDay() throws {
        let input =
"""
p=<3,0,0>, v=<2,0,0>, a=<-1,0,0>
p=<4,0,0>, v=<0,0,0>, a=<-2,0,0>
"""
        XCTAssertEqual(day.run(input: input), "0")
    }
}
