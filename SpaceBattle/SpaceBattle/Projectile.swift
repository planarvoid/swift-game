//
//  Projectile.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 24/06/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class Projectile: SKShapeNode {
    
    public static func create(source: String, position: CGPoint, rotation: CGFloat, xScale: CGFloat, yScale: CGFloat) -> Projectile {
        let projectile = Projectile(rectOfSize: CGSize(width: 5, height: 15))
        projectile.userData = [ProjectileConstants.PARENT: source]
        projectile.name = "projectile"
        projectile.fillColor = SKColor.redColor()
        projectile.strokeColor = SKColor.redColor()
        projectile.position = position
        projectile.zRotation = rotation
        projectile.xScale = xScale
        projectile.yScale = yScale
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        projectile.physicsBody?.dynamic = true
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.Projectile
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.Ship
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.None
        projectile.physicsBody?.usesPreciseCollisionDetection = true
        return projectile
    }
    
    public func draw(scene: SKScene) {
        scene.addChild(self)
    }
}