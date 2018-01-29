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
    case engineLoad = "Engine Load"
    case engineSpeed = "Engine Speed"
    case vehicleSpeed = "Vehicle Speed"
    case fuelRailPressure = "Fuel Rail Pressure"
    case undefined = "Undefined"
    
    static let dataTypes = [engineLoad, engineSpeed, vehicleSpeed, fuelRailPressure]
}

enum DriveStyle: String {
    case soft = "Soft"
    case optimal = "Optimal"
    case hard = "Hard"
    case undefined = "Undefined"
    
    static let dataTypes = [soft, optimal, hard]
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
