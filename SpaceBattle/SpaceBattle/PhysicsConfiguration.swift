//
//  PhysicsConfiguration.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 08/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class PhysicsConfiguration {
    func getComponent() -> PhysicsComponent {
        preconditionFailure("This method must be overridden")
    }
}

public class ShipPhysicsConfiguration: PhysicsConfiguration {
    override func getComponent() -> PhysicsComponent {
        return ShipPhysicsComponent(configuration: self)
    }
}

public class CirclePhysicsConfiguration: PhysicsConfiguration {
    let circleOfRadius: CGFloat
    
    init(circleOfRadius: CGFloat) {
        self.circleOfRadius = circleOfRadius
    }
    override func getComponent() -> PhysicsComponent {
        return CirclePhysicsComponent(configuration: self)
    }
}