//
//  CalculatedDriveItem.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 29.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class CalculatedDriveItem: NSObject {

     // MARK: - Variables
    
    let engineSpeed: Int
    let vehicleSpeed: Int
    let engineLoad: Float
    let fuelRailPressure: Int
    
    let timestamp: Int
    let position: (lat: Float, lng: Float)
    
    var engineSpeedDelta: Int?
    var vehicleSpeedDelta: Int?
    
    var vehicleEngineSpeedRatio: Float?
    var fuelRailPressureRatio: Float?
    
    var engineSpeedCorrect = true
    var vehicleSpeedCorrect = true
    var vehicleEngineSpeedRatioCorrect = true
    var fuelRailPressureRatioCorrect = true
    var engineLoadCorrect = true
    
    var markDangerItem = false
    
     // MARK: - Initialization
    
    init(engineSpeed: Int, vehicleSpeed: Int, engineLoad: Float, fuelRailPressure: Int, timestamp: Int,
         position: (lat: Float, lng: Float)) {
        self.engineSpeed = engineSpeed
        self.vehicleSpeed = vehicleSpeed
        self.engineLoad = engineLoad
        self.fuelRailPressure = fuelRailPressure
        self.timestamp = timestamp
        self.position = position
    }
    
     // MARK: - Functions
    
    func scoreDriveDangerItem() {
        var score = 0
        for item in [engineSpeedCorrect, vehicleSpeedCorrect, vehicleEngineSpeedRatioCorrect, fuelRailPressureRatioCorrect, engineLoadCorrect] {
            if !item {
                score += 1
            }
        }
        if score > 1  {
            markDangerItem = true
        }
    }
    
    func convertItemToCSVItem(_ score: String) -> String? {
        if let engineSpeedDelta = engineSpeedDelta, let vehicleSpeedDelta = vehicleSpeedDelta, let vehicleEngineSpeedRatio = vehicleEngineSpeedRatio,
            let fuelRailPressureRatio = fuelRailPressureRatio {
            return "\(engineSpeedDelta), \(vehicleSpeedDelta), \(vehicleEngineSpeedRatio), \(fuelRailPressureRatio), \(engineLoad), \(score)\n"
        }
        return nil
    }
    
    func calculateVehicleEngineSpeedRatio(maxVehicleSpeed: Float, maxRPM: Float) {
        vehicleEngineSpeedRatio = (vehicleSpeed.float / maxVehicleSpeed) / (engineSpeed.float / maxRPM)
    }
    
    func calculateFuelRailPressureRatio(baseFuelRailPressure: Int) {
        fuelRailPressureRatio = fuelRailPressure.float / baseFuelRailPressure.float
    }
    
    func calculateRangeOfValues() {
        if let engineSpeedDelta = engineSpeedDelta, engineSpeedDelta > ReferenceValues.maxEngineSpeedRatio {
            engineSpeedCorrect = false
        }
        
        if let vehicleSpeedDelta = vehicleSpeedDelta, vehicleSpeedDelta > ReferenceValues.maxVehicleSpeedRatio ||
            vehicleSpeedDelta < ReferenceValues.minVehicleSpeedRatio {
            vehicleSpeedCorrect = false
        }
        
        if let vehicleEngineSpeedRatio = vehicleEngineSpeedRatio, vehicleEngineSpeedRatio > ReferenceValues.maxVehicleEngineSpeedRatio ||
            vehicleEngineSpeedRatio < ReferenceValues.minVehicleEngineSpeedRatio {
                vehicleEngineSpeedRatioCorrect = false
        }
        
        if let fuelRailPressureRatio = fuelRailPressureRatio, fuelRailPressureRatio > ReferenceValues.maxFuelRailPressure {
            fuelRailPressureRatioCorrect = false
        }
        
        if engineLoad > ReferenceValues.maxEngineLoad {
            engineLoadCorrect = false
        }
        
    }
}
