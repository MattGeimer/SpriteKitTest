//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by Matthew Geimer on 9/19/20.
//

import Foundation
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var timeInterval: TimeInterval = TimeInterval()
    
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    override func didMove(to view: SKView) {
        //physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func sceneDidLoad() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}

        let location = touch.location(in: self)
        
        spawnBall(location: location, color: .cyan)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if currentTime - timeInterval > 0.05 {
            let location = CGPoint(x: UIScreen.main.bounds.width * CGFloat(arc4random_uniform(100)) / 100, y: UIScreen.main.bounds.height)
            spawnBall(location: location, color: colors.randomElement()!)
            timeInterval = currentTime
        }
    }
    
    private func spawnBall(location: CGPoint, color: UIColor) {
        let ball = SKShapeNode(circleOfRadius: 25 ) // Size of Circle
        ball.position = location  //Middle of Screen
        ball.fillColor = color
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        self.addChild(ball)
    }
}
