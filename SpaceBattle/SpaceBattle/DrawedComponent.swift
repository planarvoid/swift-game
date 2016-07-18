//
//  DrawedComponent.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 01/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation
import SpriteKit

public class DrawedComponent {
    func drawedNode() -> SKNode {
        preconditionFailure("This method must be overridden")
    }
}