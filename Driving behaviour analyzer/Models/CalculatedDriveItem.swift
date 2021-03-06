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
    var vehicleSpeedUpCorrect = true
    var vehicleSpeedDownCorrect = true
    var vehicleEngineSpeedRatioCorrect = true
    var fuelRailPressureRatioCorrect = true
    var engineLoadCorrect = true
    
    var markDangerItem = false
    
    var vehicleSpeedUpExeeded = 0
    var vehicleSpeedDownExeeded = 0
    var engineSpeedExeeded = 0
    var fuelRailPressureRatioExeeded: Float = 0.0
    
    var driveStyle: DriveStyle?
    
     // MARK: - Initialization
    
    init(engineSpeed: Int, vehicleSpeed: Int, engineLoad: Float, fuelRailPressure: Int, timestamp: Int,
         position: (lat: Float, lng: Float), driveStyle: DriveStyle) {
        self.engineSpeed = engineSpeed
        self.vehicleSpeed = vehicleSpeed
        self.engineLoad = engineLoad
        self.fuelRailPressure = fuelRailPressure
        self.timestamp = timestamp
        self.position = position
        self.driveStyle = driveStyle
    }
    
     // MARK: - Functions
    
    func convertItemToCSVItem() -> String? {
        if let engineSpeedDelta = engineSpeedDelta, let vehicleSpeedDelta = vehicleSpeedDelta, let vehicleEngineSpeedRatio = vehicleEngineSpeedRatio,
            let fuelRailPressureRatio = fuelRailPressureRatio {
            return "\(engineSpeedDelta), \(vehicleSpeedDelta), \(vehicleEngineSpeedRatio), \(fuelRailPressureRatio), \(engineLoad) \n"
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
            engineSpeedExeeded = engineSpeedDelta - ReferenceValues.maxEngineSpeedRatio
            engineSpeedCorrect = false
        }
        
        if let vehicleSpeedDelta = vehicleSpeedDelta, vehicleSpeedDelta < ReferenceValues.minVehicleSpeedRatio {
            vehicleSpeedDownExeeded = abs(vehicleSpeedDelta + ReferenceValues.minVehicleSpeedRatio)
            vehicleSpeedDownCorrect = false
        }
        
        if let vehicleSpeedDelta = vehicleSpeedDelta, vehicleSpeedDelta > ReferenceValues.maxVehicleSpeedRatio {
            vehicleSpeedUpExeeded = vehicleSpeedDelta - ReferenceValues.maxVehicleSpeedRatio
            vehicleSpeedUpCorrect = false
        }
        
        if let vehicleEngineSpeedRatio = vehicleEngineSpeedRatio, vehicleEngineSpeedRatio > ReferenceValues.maxVehicleEngineSpeedRatio ||
            vehicleEngineSpeedRatio < ReferenceValues.minVehicleEngineSpeedRatio {
                vehicleEngineSpeedRatioCorrect = false
        }
        
        if let fuelRailPressureRatio = fuelRailPressureRatio, fuelRailPressureRatio > ReferenceValues.maxFuelRailPressure {
            fuelRailPressureRatioExeeded += fuelRailPressureRatio - ReferenceValues.maxFuelRailPressure
            fuelRailPressureRatioCorrect = false
        }
        
        if engineLoad > ReferenceValues.maxEngineLoad {
            engineLoadCorrect = false
        }
        
    }
}
