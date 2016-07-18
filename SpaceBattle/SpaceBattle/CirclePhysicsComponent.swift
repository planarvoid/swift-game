//
//  ProjectilePhysicsComponent.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 01/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

class CirclePhysicsComponent: PhysicsComponent {
    let configuration: CirclePhysicsConfiguration
    init(configuration: CirclePhysicsConfiguration) {
        self.configuration = configuration
    }
    override func addPhysicsBody(node: SKNode) {
        let physicsBody = SKPhysicsBody(circleOfRadius: configuration.circleOfRadius)
        physicsBody.dynamic = true
        physicsBody.categoryBitMask = PhysicsCategory.Projectile
        physicsBody.contactTestBitMask = PhysicsCategory.Ship
        physicsBody.collisionBitMask = PhysicsCategory.None
        physicsBody.usesPreciseCollisionDetection = true
        node.physicsBody = physicsBody
    }
}