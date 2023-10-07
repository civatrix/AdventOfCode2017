//
//  Day20.swift
//  AdventOfCode
//
//  Created by DanielJohns on 2022-11-09.
//

import Foundation

class Particle: Equatable {
    static func == (lhs: Particle, rhs: Particle) -> Bool {
        lhs.position == rhs.position
    }
    
    struct Vector: Hashable {
        public static func += (left: inout Vector, right: Vector) {
            left = left + right
        }
        
        public static func + (left: Vector, right: Vector) -> Vector {
            Vector(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
        }
        
        let x, y, z: Int
    }
    
    init(_ numbers: [Int]) {
        position = Vector(x: numbers[0], y: numbers[1], z: numbers[2])
        speed = Vector(x: numbers[3], y: numbers[4], z: numbers[5])
        acceleration = Vector(x: numbers[6], y: numbers[7], z: numbers[8])
    }
    
    var position: Vector
    var speed: Vector
    let acceleration: Vector
    
    func update() {
        speed += acceleration
        position += speed
    }
}

final class Day20: Day {
    func run(input: String) -> String {
        var particles = input.lines.map { Particle($0.allDigits) }
        
        var countdown = 10_000
        while true {
            particles.forEach { $0.update() }
            
            let positions = particles.reduce(into: [Particle.Vector: Int]()) { $0[$1.position, default: 0] += 1 }
            let collisions = Set(positions.filter { $0.value > 1 }.map { $0.key })
            if collisions.count > 0 {
                countdown = 10_000
                particles = particles.filter { !collisions.contains($0.position) }
            }
            
            countdown -= 1
            if countdown == 0 {
                break
            }
        }
        
        return particles.count.description
    }
}
