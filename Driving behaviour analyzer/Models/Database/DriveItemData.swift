//
//  DriveItemData.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 06.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

enum DataType: String {
    case engineLoad = "EngineLoad"
    case engineSpeed = "EngineSpeed"
    case vehicleSpeed = "VehicleSpeed"
    case fuelRailPressure = "Fuel Rail Pressure"
    case undefined = "Undefined"
    
    static let dataTypes = [engineLoad, engineSpeed, vehicleSpeed, fuelRailPressure]
}

enum DriveStyle: Int {
    case soft = 0
    case optimal = 1
    case hard = 2
    case undefined = 3
    
    static let dataTypes = [soft, optimal, hard]
    
    static func random() -> DriveStyle {
        return dataTypes.randomItem
    }
}

class DriveItemData: Object {

    @objc dynamic var value: Float = 0.0
    @objc dynamic var timestamp: Int = 0
    @objc dynamic var lat: Float = 0.0
    @objc dynamic var lng: Float = 0.0
    
    @objc dynamic var dataType = DataType.undefined.rawValue
    @objc dynamic var driveStyle = DriveStyle.undefined.rawValue
    
    var dataTypeEnum: DataType {
        get {
            if let dataType = DataType(rawValue: dataType) {
                return dataType
            } else {
                return DataType.undefined
            }
        }
        set {
            dataType = newValue.rawValue
        }
    }
    
    var driveStyleEnum: DriveStyle {
        get {
            if let driveStyle = DriveStyle(rawValue: driveStyle) {
                return driveStyle
            } else {
                return DriveStyle.undefined
            }
        }
        set {
            driveStyle = newValue.rawValue
        }
    }
}
