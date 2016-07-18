//
//  ShipDrawerComponent.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 08/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class ShipDrawedComponent: DrawedComponent {
    let configuration: ShipDrawerConfiguration
    init(configuration: ShipDrawerConfiguration) {
        self.configuration = configuration
    }
    public override func drawedNode() -> SKNode {
        let ship = SKSpriteNode(imageNamed:configuration.imageResource)
        return ship
    }
}