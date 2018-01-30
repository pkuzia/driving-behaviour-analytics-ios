//
//  ReferenceValues.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 30.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import Foundation

class ReferenceValues {
    
    // MARK: - Reference Constans
    
    static let maxVehicleSpeedRatio: Int = 5
    static let minVehicleSpeedRatio: Int = -20
    
    static let maxEngineSpeedRatio: Int = 500
    
    static let minVehicleEngineSpeedRatio: Float = 0.5
    static let maxVehicleEngineSpeedRatio: Float = 1.5
    
    static func maxFuelRailPressure(baseFuelRailPressure: Int) -> Int {
        return 4 * baseFuelRailPressure
    }
}
