//
//  ProjectileDrawedComponent.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 01/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class ProjectileDrawedComponent: DrawedComponent {
    let configuration: ProjectileDrawerConfiguration
    init(configuration: ProjectileDrawerConfiguration) {
        self.configuration = configuration
    }
    public override func drawedNode() -> SKNode {
        let projectile = SKShapeNode(rectOfSize: configuration.rectOfSize)
        projectile.fillColor = configuration.color
        projectile.strokeColor = configuration.color
        return projectile
    }
}