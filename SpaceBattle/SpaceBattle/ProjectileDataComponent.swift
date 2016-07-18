//
//  ProjectileDataComponent.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 01/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class ProjectileDataComponent: DataComponent {
    let configuration: ProjectileDataConfiguration
    init(configuration: ProjectileDataConfiguration) {
        self.configuration = configuration
    }
    override func addData(node: SKNode, name: String, parent: String?) {
        node.name = name
        if (parent != nil) {
            node.userData = [ProjectileConstants.PARENT: parent!]
        }
    }
}