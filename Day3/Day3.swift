//
//  Day3.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

final class Day3: Day {
    func run(input: String) -> String {
        let target = Int(input)!
        
        var ring = 1
        while (ring * ring) < target {
            ring += 2
        }
        
        let corners = (0 ..< 4).map { (ring * ring) - ($0 * (ring - 1))}
        for corner in corners {
            let distance = abs(corner - target)
            if distance <= (ring - 1) / 2 {
                return (ring - 1 - distance).description
            }
        }
        
        return ""
    }
}
