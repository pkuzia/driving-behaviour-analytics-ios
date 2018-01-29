//
//  CalculatedDriveItem.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 29.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class CalculatedDriveItem: NSObject {

    let engineSpeed: Int
    let vehicleSpeed: Int
    let engineLoad: Float
    let fuelRailPressure: Int
    
    let timestamp: Int
    let position: (lat: Float, lng: Float)
    
    init(engineSpeed: Int, vehicleSpeed: Int, engineLoad: Float, fuelRailPressure: Int, timestamp: Int,
         position: (lat: Float, lng: Float)) {
        self.engineSpeed = engineSpeed
        self.vehicleSpeed = vehicleSpeed
        self.engineLoad = engineLoad
        self.fuelRailPressure = fuelRailPressure
        self.timestamp = timestamp
        self.position = position
    }
}
