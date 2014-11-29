//
//  Block.swift
//  Tetris
//
//  Created by Mohit Deshpande on 28/11/14.
//  Copyright (c) 2014 Mohit Deshpande. All rights reserved.
//
//  Represents the independent blocks in the game as objects

import SpriteKit

// Number of colors available in tetris
let NumberOfColors: UInt32 = 6

// enumeration of type int, implements printable protocol(generates human readable string when debugging)
enum BlockColor: Int, Printable {
    
    // list of enumerable options, blue begins at 0, ends with yellow at 5
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // computed property, code block is invocked when accessing it's value
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    // property required to adhere to Printable protocol
    var description: String {
        return self.spriteName
    }
    
    // creates block colors using rawValue
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
}


// Hashable allows Block to be stored in Array2D
class Block: Hashable, Printable {
    
    // Constants. A block should not be able to change colors mid game
    let color: BlockColor
    
    // Properties. Represent the location of the Block on the board
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?   // represents visual element to be used by GameScene
    
    // get the filename forr the sprite using enum BlockColor
    var spriteName: String {
        return color.spriteName
    }
    
    // hashValue calculated property, which is required in order to support the Hashable protocol
    var hashValue: Int {
        return self.column ^ self.row   // return the exclusive-or of our row and column porperties to generate a unique integer for each block.
    }
    
    // Implement description to comply with the Printable protocol
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// Create custom operator. Returns true if and only if both Blocks are in the same location and of the same color
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}