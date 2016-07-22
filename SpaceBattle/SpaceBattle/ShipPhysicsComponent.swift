//
//  ShipPhysicsComponent.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 01/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

class ShipPhysicsComponent: PhysicsComponent {
    let configuration: ShipPhysicsConfiguration
    init(configuration: ShipPhysicsConfiguration) {
        self.configuration = configuration
    }
    
    override func addPhysicsBody(node: SKNode) {
        if let spriteNode = node as? SKSpriteNode {
            let physicsBody = SKPhysicsBody(rectangleOfSize: spriteNode.size) // 1
            physicsBody.dynamic = true // 2
            physicsBody.affectedByGravity = true
            physicsBody.allowsRotation = true
            physicsBody.friction = 0.02
            physicsBody.restitution = 1
            physicsBody.linearDamping = 0.02
            physicsBody.angularDamping = 0.02
            physicsBody.categoryBitMask = PhysicsCategory.Ship// 3
            physicsBody.contactTestBitMask = PhysicsCategory.Projectile // 4
            physicsBody.collisionBitMask = PhysicsCategory.None // 5
            node.physicsBody = physicsBody
        } else {
            preconditionFailure("Ship has to have sprite node body")
        }
    }
}