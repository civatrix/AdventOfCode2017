//
//  Day4Tests.swift
//  AdventOfCodeTests
//
//  Created by DanielJohns on 2022-11-09.
//

import XCTest

final class Day4Tests: XCTestCase {
    let day = Day4()
    
    func testDay() throws {
        let input =
"""
abcde fghij
abcde xyz ecdab
a ab abc abd abf abj
iiii oiii ooii oooi oooo
oiii ioii iioi iiio
"""
        XCTAssertEqual(day.run(input: input), "3")
    }
}
