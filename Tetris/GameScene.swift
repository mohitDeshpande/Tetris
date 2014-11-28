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

let TickLengthLevelOne = NSTimeInterval(600)    // slowest speed at which the shapes will travel

class GameScene: SKScene {
    
    // closure which takes non parameters and return no parameters.
    var tick:(() -> ())?
    
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?    // last time we experienced a tick
    
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
        
        if  lastTick == nil {   // paused state
            return
        }
        // recover time passed since last execution of update
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0 // to get a positive millisecond value
        if timePassed > tickLengthMillis { // if enough time has elapsed repost a tick
            lastTick = NSDate()
            tick?()
        }
    }
    
    // accessor methods to let external classes stop and start the ticking process
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
