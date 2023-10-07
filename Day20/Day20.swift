//
//  Day20.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

class Particle: Comparable {
    static func == (lhs: Particle, rhs: Particle) -> Bool {
        (lhs.position == rhs.position) && (lhs.speed == rhs.speed) && (lhs.acceleration == rhs.acceleration)
    }
    
    static func < (lhs: Particle, rhs: Particle) -> Bool {
        (lhs.acceleration, lhs.speed, lhs.position) < (rhs.acceleration, rhs.speed, rhs.position)
    }
    
    struct Vector: Comparable {
        static func < (lhs: Vector, rhs: Vector) -> Bool {
            (abs(lhs.x) + abs(lhs.y) + abs(lhs.z)) < (abs(rhs.x) + abs(rhs.y) + abs(rhs.z))
        }
        
        static let zero = Vector(x: 0, y: 0, z: 0)
        
        public static func += (left: inout Vector, right: Vector) {
            left = left + right
        }
        
        public static func + (left: Vector, right: Vector) -> Vector {
            Vector(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
        }
        
        public static func -= (left: inout Vector, right: Vector) {
            left = left - right
        }
        
        public static func - (left: Vector, right: Vector) -> Vector {
            Vector(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
        }
        
        let x, y, z: Int
        
        var normalized: Vector {
            Vector(x: x.clamped(to: -1 ... 1), y: y.clamped(to: -1 ... 1), z: z.clamped(to: -1 ... 1))
        }
    }
    
    init(_ numbers: [Int]) {
        position = Vector(x: numbers[0], y: numbers[1], z: numbers[2])
        speed = Vector(x: numbers[3], y: numbers[4], z: numbers[5])
        acceleration = Vector(x: numbers[6], y: numbers[7], z: numbers[8])
    }
    
    var position: Vector
    var speed: Vector
    let acceleration: Vector
    var finished = false
    
    func update() {
        speed += acceleration
        position += speed
        
        finished = position.normalized == acceleration.normalized && position.normalized == speed.normalized
    }
}

final class Day20: Day {
    func run(input: String) -> String {
        let particles = input.lines.map { Particle($0.allDigits) }
                
        let closest = particles.min()!
        return particles.firstIndex(of: closest)!.description
    }
}
