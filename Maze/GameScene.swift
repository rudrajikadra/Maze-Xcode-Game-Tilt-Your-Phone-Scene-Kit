//
//  GameScene.swift
//  Maze
//
//  Created by Rudra Jikadra on 10/01/18.
//  Copyright © 2018 Rudra Jikadra. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()
    var col: Int = 1
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        endNode = self.childNode(withName: "endNode") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main){
            (Data, error) in
            
            self.physicsWorld.gravity = CGVector(dx: CGFloat((Data?.acceleration.x)!) * 15, dy: CGFloat((Data?.acceleration.y)!) * 15)
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            var a = Int(arc4random_uniform(9) + 1)
            if col == a && a != 9{
                a = a + 1
            } else if col == a && a == 9 {
                a = 1
            }
            col = a
            if a == 1 {
                endNode.color = UIColor.white
            } else if a == 2 {
                endNode.color = UIColor.yellow
            } else if a == 3 {
                endNode.color = UIColor.purple
            } else if a == 4 {
                endNode.color = UIColor.orange
            } else if a == 5 {
                endNode.color = UIColor.magenta
            } else if a == 6 {
                endNode.color = UIColor.green
            } else if a == 7 {
                endNode.color = UIColor.cyan
            } else if a == 8 {
                endNode.color = UIColor.brown
            } else {
                endNode.color = UIColor.blue
            }
            
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
