//
//  GameViewController.swift
//  Tetris
//
//  Created by Mohit Deshpande on 26/11/14.
//  Copyright (c) 2014 Mohit Deshpande. All rights reserved.
//
//  GameViewController is responsible for handling user input and communicating
//  between GameScene and game logic.

import UIKit
import SpriteKit



class GameViewController: UIViewController {
    
    var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene
        skView.presentScene(scene)
        
    }


    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
