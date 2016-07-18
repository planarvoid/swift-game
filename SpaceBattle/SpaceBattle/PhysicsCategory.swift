//
//  PhysicsCategory.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 24/06/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Ship      : UInt32 = 0b1       // 1
    static let Projectile: UInt32 = 0b10      // 2
}