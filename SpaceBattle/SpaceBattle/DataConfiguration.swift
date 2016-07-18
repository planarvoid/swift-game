//
//  DataConfiguration.swift
//  SpaceBattle
//
//  Created by Vojtech Smrček on 08/07/16.
//  Copyright © 2016 Vojtech Smrček. All rights reserved.
//

import Foundation

public class DataConfiguration {
    func getComponent() -> DataComponent {
        preconditionFailure("This method must be overridden")
    }
}
public class ProjectileDataConfiguration: DataConfiguration {
    public override func getComponent() -> ProjectileDataComponent {
        return ProjectileDataComponent(configuration: self)
    }
}