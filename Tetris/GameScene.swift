//
//  GameScene.swift
//  Tetris
//
//  Created by Mohit Deshpande on 26/11/14.
//  Copyright (c) 2014 Mohit Deshpande. All rights reserved.
//
//  GameScene is responsible for displaying everything in the game. It also
//  plays the sounds and keeps a track of the time.

import SpriteKit

class GameScene: SKScene {
    
    required init(coder aDecoder: NSCoder!) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        // Since tetris will be drawn from the top down so we anchor
        // out game in the top-left corner of the sceen ie. 0, 1.0
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
