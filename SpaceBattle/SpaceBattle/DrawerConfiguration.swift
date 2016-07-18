//
//  DrawerConfiguration.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 08/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class DrawerConfiguration {
    func getComponent() -> DrawedComponent {
        preconditionFailure("This method must be overridden")
    }
}

public class ProjectileDrawerConfiguration: DrawerConfiguration {
    let rectOfSize: CGSize
    let color: SKColor
    init(width: CGFloat, height: CGFloat, color: SKColor) {
        self.rectOfSize = CGSize(width: width, height: height)
        self.color = color
    }
    public override func getComponent() -> ProjectileDrawedComponent {
        return ProjectileDrawedComponent(configuration: self)
    }
}

public class ShipDrawerConfiguration: DrawerConfiguration {
    let imageResource: String
    init(imageResource: String) {
        self.imageResource = imageResource
    }
    public override func getComponent() -> ShipDrawedComponent {
        return ShipDrawedComponent(configuration: self)
    }
}