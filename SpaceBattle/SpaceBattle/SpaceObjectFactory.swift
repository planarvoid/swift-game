//
//  SpaceObjectFactory.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 08/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class SpaceObjectFactory {
    static func createProjectile() -> SpaceObject {
        let dataConfiguration = ProjectileDataConfiguration()
        let physicsConfiguration = CirclePhysicsConfiguration(circleOfRadius: 10)
        let drawerConfiguration = ProjectileDrawerConfiguration(width: 5, height: 15, color: SKColor.redColor())
        return SpaceObject(dataConfiguration: dataConfiguration, drawerConfiguration: drawerConfiguration, physicsConfiguration: physicsConfiguration)
    }
    
    static func createShip() -> SpaceObject {
        let dataConfiguration = ProjectileDataConfiguration()
        let physicsConfiguration = ShipPhysicsConfiguration()
        let drawerConfiguration = ShipDrawerConfiguration(imageResource: "Spaceship")
        return SpaceObject(dataConfiguration: dataConfiguration, drawerConfiguration: drawerConfiguration, physicsConfiguration: physicsConfiguration)
    }
}