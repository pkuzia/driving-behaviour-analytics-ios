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
    
    fileprivate let engineSpeedOptimalFloor = 0.014
    fileprivate let engineSpeedOptimalCeil = 0.047
    fileprivate let engineSpeedHardCeil = 0.15
    
    fileprivate let vehicleSpeedOptimalFloor =  0.03
    fileprivate let vehicleSpeedOptimalCeil = 0.1
    fileprivate let vehicleSpeedHardCeil = 0.35
    
    fileprivate let vehicleEngineSpeedOptimalFloor = 0.03
    fileprivate let vehicleEngineSpeedOptimalCeil = 0.2
    fileprivate let vehicleEngineSpeedHardCeil = 0.4
    
    fileprivate let engineLoadOptimalFloor = 0.04
    fileprivate let engineLoadOptimalCeil = 0.11
    fileprivate let engineLoadHardCeil = 0.32
    
    fileprivate let fuelRailPressureOptimalFloor = 0.03
    fileprivate let fuelRailPressureOptimalCeil = 0.2
    fileprivate let fuelRailPressureHardCeil = 0.4
    
    fileprivate let vehicleSpeedUpExceededOptimalFloor = 1.5
    fileprivate let vehicleSpeedUpExceededOptimalCeil = 2.5
    fileprivate let vehicleSpeedUpExceededHardCeil = 5.0
    
    fileprivate let vehicleSpeedDownExceededOptimalFloor = 15.0
    fileprivate let vehicleSpeedDownExceededOptimalCeil = 22.0
    fileprivate let vehicleSpeedDownExceededHardCeil = 33.0
    
    fileprivate let engineSpeedExceededOptimalFloor = 95.0
    fileprivate let engineSpeedExceededOptimalCeil = 220.0
    fileprivate let engineSpeedExceededHardCeil = 380.0
    
    fileprivate let fuelRailPressureExceededOptimalFloor = 0.18
    fileprivate let fuelRailPressureExceededOptimalCeil = 0.65
    fileprivate let fuelRailPressureExceededHardCeil = 0.95
    
    fileprivate var lastGenerated: DriveStyle = .hard
    
    weak var delegate: DataGeneratorViewModelDelegate?
    
    // MARK: - Functions
    
    func engineSpeed(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: engineSpeedOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: engineSpeedOptimalFloor, secondNum: engineSpeedOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: engineSpeedOptimalCeil, secondNum: engineSpeedHardCeil)
        default:
            return "0.0"
        }
    }
    
    
    func vehicleSpeed(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleSpeedOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleSpeedOptimalFloor, secondNum: vehicleSpeedOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleSpeedOptimalCeil, secondNum: vehicleSpeedHardCeil)
        default:
            return "0.0"
        }
    }
    
    func vehicleEngineSpeed(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleEngineSpeedOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleEngineSpeedOptimalFloor, secondNum: vehicleEngineSpeedOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleEngineSpeedOptimalCeil, secondNum: vehicleEngineSpeedHardCeil)
        default:
            return "0.0"
        }
    }
    
    func engineLoad(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: engineLoadOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: engineLoadOptimalFloor, secondNum: engineLoadOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: engineLoadOptimalCeil, secondNum: engineLoadHardCeil)
        default:
            return "0.0"
        }
    }
    
    func fuelRailPressure(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: fuelRailPressureOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: fuelRailPressureOptimalFloor, secondNum: fuelRailPressureOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: fuelRailPressureOptimalCeil, secondNum: fuelRailPressureHardCeil)
        default:
            return "0.0"
        }
    }
    
    func vehicleSpeedUpExceeded(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleSpeedUpExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleSpeedUpExceededOptimalFloor, secondNum: vehicleSpeedUpExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleSpeedUpExceededOptimalCeil, secondNum: vehicleSpeedUpExceededHardCeil)
        default:
            return "0.0"
        }
    }
    
    func vehicleSpeedDownExceeded(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: vehicleSpeedDownExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: vehicleSpeedDownExceededOptimalFloor, secondNum: vehicleSpeedDownExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: vehicleSpeedDownExceededOptimalCeil, secondNum: vehicleSpeedDownExceededHardCeil)
        default:
            return "0.0"
        }
    }
    
    func engineSpeedExceeded(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: engineSpeedExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: engineSpeedExceededOptimalFloor, secondNum: engineSpeedExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: engineSpeedExceededOptimalCeil, secondNum: engineSpeedExceededHardCeil)
        default:
            return "0.0"
        }
    }
    
    func fuelRailPressureExceeded(driveStyle: DriveStyle) -> String {
        switch driveStyle {
        case .soft:
            return randomValueBeetween(firstNum: 0.0, secondNum: fuelRailPressureExceededOptimalFloor)
        case .optimal:
            return randomValueBeetween(firstNum: fuelRailPressureExceededOptimalFloor, secondNum: fuelRailPressureExceededOptimalCeil)
        case .hard:
            return randomValueBeetween(firstNum: fuelRailPressureExceededOptimalCeil, secondNum: fuelRailPressureExceededHardCeil)
        default:
            return "0.0"
        }
    }
    
    func generateData() -> String {
        let loop = 10000
        var CSV = ""
        var randomize = false
        for index in 0...loop {
            if index%10 == 0 {
                randomize = true
            }
            switch lastGenerated {
            case .soft:
                CSV += generateStyleData(driveStyle: .optimal, randomize: randomize)
                randomize = false
            case .optimal:
                CSV += generateStyleData(driveStyle: .hard, randomize: randomize)
                randomize = false
            case .hard:
                CSV += generateStyleData(driveStyle: .soft, randomize: randomize)
                randomize = false
            default:
                break
            }
        }
        return CSV
    }
    
    func generateStyleData(driveStyle: DriveStyle, randomize: Bool) -> String {
        lastGenerated = driveStyle
        var csvDriveStyle = driveStyle
        if randomize {
            csvDriveStyle = DriveStyle.random()
            print("Randomize from \(driveStyle) to \(csvDriveStyle)")
        }
        return "\(csvDriveStyle.rawValue) 1:\(engineSpeed(driveStyle: driveStyle)) 2:\(vehicleSpeed(driveStyle: driveStyle)) 3:\(vehicleEngineSpeed(driveStyle: driveStyle)) 4:\(engineLoad(driveStyle: driveStyle)) 5:\(fuelRailPressure(driveStyle: driveStyle)) 6:\(vehicleSpeedUpExceeded(driveStyle: driveStyle)) 7:\(vehicleSpeedDownExceeded(driveStyle: driveStyle)) 8:\(engineSpeedExceeded(driveStyle: driveStyle)) 9:\(fuelRailPressureExceeded(driveStyle: driveStyle)) \n"
    }
    
    fileprivate func randomValueBeetween(firstNum: Double, secondNum: Double) -> String {
        let value = Double(arc4random()) / Double(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
        return String(format: "%.7f", value)
    }
    
}
