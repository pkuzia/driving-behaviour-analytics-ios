//
//  DataGeneratorViewModel.swift
//  Driving behaviour analyzer
//
//  Created by prkuz1 on 21.05.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

protocol DataGeneratorViewModelDelegate: class {
    
}

class DataGeneratorViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    let engineSpeedOptimalFloor = 0.0
    let engineSpeedOptimalCeil = 0.0
    let engineSpeedHardCeil = 0.0
    
    let vehicleSpeedOptimalFloor =  0.0
    let vehicleSpeedOptimalCeil = 0.0
    let vehicleSpeedHardCeil = 0.0

    let vehicleEngineSpeedOptimalFloor = 0.0
    let vehicleEngineSpeedOptimalCeil = 0.0
    let vehicleEngineSpeedHardCeil = 0.0
    
    let engineLoadOptimalFloor = 0.0
    let engineLoadOptimalCeil = 0.0
    let engineLoadHardCeil = 0.0
    
    let fuelRailPressureOptimalFloor = 0.0
    let fuelRailPressureOptimalCeil = 0.0
    let fuelRailPressureHardCeil = 0.0
    
    let vehicleSpeedUpExceededOptimalFloor = 0.0
    let vehicleSpeedUpExceededOptimalCeil = 0.0
    let vehicleSpeedUpExceededHardCeil = 0.0
    
    let vehicleSpeedDownExceededOptimalFloor = 0.0
    let vehicleSpeedDownExceededOptimalCeil = 0.0
    let vehicleSpeedDownExceededHardCeil = 0.0
    
    let engineSpeedExceededOptimalFloor = 0.0
    let engineSpeedExceededOptimalCeil = 0.0
    let engineSpeedExceededHardCeil = 0.0
    
    let fuelRailPressureExceededOptimalFloor = 0.0
    let fuelRailPressureExceededOptimalCeil = 0.0
    let fuelRailPressureExceededHardCeil = 0.0
    
    weak var delegate: DataGeneratorViewModelDelegate?
    
    // MARK: - Functions
    
    func engineSpeed(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: engineSpeedOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: engineSpeedOptimalFloor, secondNum: engineSpeedOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: engineSpeedOptimalCeil, secondNum: engineSpeedHardCeil)
        default:
            return 0.0
        }
    }
    
    
    func vehicleSpeed(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleSpeedOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleSpeedOptimalFloor, secondNum: vehicleSpeedOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleSpeedOptimalCeil, secondNum: vehicleSpeedHardCeil)
        default:
            return 0.0
        }
    }
    
    func vehicleEngineSpeed(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleEngineSpeedOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleEngineSpeedOptimalFloor, secondNum: vehicleEngineSpeedOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleEngineSpeedOptimalCeil, secondNum: vehicleEngineSpeedHardCeil)
        default:
            return 0.0
        }
    }
    
    func engineLoad(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: engineLoadOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: engineLoadOptimalFloor, secondNum: engineLoadOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: engineLoadOptimalCeil, secondNum: engineLoadHardCeil)
        default:
            return 0.0
        }
    }
    
    func fuelRailPressure(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: fuelRailPressureOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: fuelRailPressureOptimalFloor, secondNum: fuelRailPressureOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: fuelRailPressureOptimalCeil, secondNum: fuelRailPressureHardCeil)
        default:
            return 0.0
        }
    }
    
    func vehicleSpeedUpExceeded(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleSpeedUpExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleSpeedUpExceededOptimalFloor, secondNum: vehicleSpeedUpExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleSpeedUpExceededOptimalCeil, secondNum: vehicleSpeedUpExceededHardCeil)
        default:
            return 0.0
        }
    }
    
    func vehicleSpeedDownExceeded(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleSpeedDownExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleSpeedDownExceededOptimalFloor, secondNum: vehicleSpeedDownExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleSpeedDownExceededOptimalCeil, secondNum: vehicleSpeedDownExceededHardCeil)
        default:
            return 0.0
        }
    }
    
    func engineSpeedExceeded(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: engineSpeedExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: engineSpeedExceededOptimalFloor, secondNum: engineSpeedExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: engineSpeedExceededOptimalCeil, secondNum: engineSpeedExceededHardCeil)
        default:
            return 0.0
        }
    }
    
    func fuelRailPressureExceeded(driveStyle: DriveStyle) -> Double {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: fuelRailPressureExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: fuelRailPressureExceededOptimalFloor, secondNum: fuelRailPressureExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: fuelRailPressureExceededOptimalCeil, secondNum: fuelRailPressureExceededHardCeil)
        default:
            return 0.0
        }
    }
    
    func randomValueBeetween(firstNum: Double, secondNum: Double) -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
}


