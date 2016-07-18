//
//  SpaceObject.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 01/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class SpaceObject {
    let dataConfiguration: DataConfiguration
    let drawerConfiguration: DrawerConfiguration
    let physicsConfiguration: PhysicsConfiguration
    init (dataConfiguration: DataConfiguration,
          drawerConfiguration: DrawerConfiguration,
          physicsConfiguration: PhysicsConfiguration) {
        self.dataConfiguration = dataConfiguration
        self.drawerConfiguration = drawerConfiguration
        self.physicsConfiguration = physicsConfiguration
    }
    
    public func create(source: String,
                       name: String,
                       position: CGPoint,
                       rotation: CGFloat,
                       xScale: CGFloat,
                       yScale: CGFloat) -> SKNode {
        let node = drawerConfiguration.getComponent().drawedNode();
        dataConfiguration.getComponent().addData(node, name: name, parent: source)
        physicsConfiguration.getComponent().addPhysicsBody(node)
        node.position = position
        node.zRotation = rotation
        node.xScale = xScale
        node.yScale = yScale
        return node
    }
}