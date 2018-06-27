//
//  CollectTableViewCalculatedViewModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 28.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import RealmSwift

protocol CollectTableViewCalculatedViewModelDelegate: class {
    
}

enum WorkType {
    case collect, analyze
}

class CollectTableViewCalculatedViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    let calculatedDataCellID = "calculatedDataCell"
    let calculatedDataHeaderID = "calculatedDataHeader"
    let screenTitle = "collect_calculated_table_view_title".localized
    let sendButtonTitle = "collect_calculated_send_button_title".localized
    let sendCollectionDataInfoLabel = "collect_calculated_send_info".localized
    let classifyInfoLabel = "collect_classify_info".localized
    let sendCompleteTitle = "collect_send_complete_title".localized
    let sendCompleteSubtitle = "collect_send_complete_subtitle".localized
    let classificationTitle = "classification_title".localized
    
    var driveItemData: [DriveItemData] = []
    var calculatedData: [CalculatedDriveItem] = []
    
    fileprivate let classificationService = ClassificationService()
    let calculatedDataCellSize: CGFloat = 125
    let calculatedDataHeaderSize: CGFloat = 55
    var workType: WorkType = .collect
    
    weak var delegate: CollectTableViewCalculatedViewModelDelegate?
    var classificationResponse: ClassificationResponse?
    
    // MARK: - Requests
    
    func sendCollectedData(completionHandler: @escaping (FetchResult) -> ()) {
        let collectDataRequest = CollectDataRequest(elements: convertDataToSVM())
        classificationService.sendCollectedData(collectDataRequest: collectDataRequest, completionHandler: completionHandler)
    }
    
    func classificationData(completionHandler: @escaping (FetchResult) -> ()) {
        let classificationRequest = ClassificationRequest(elements: convertDataToSVM())
        classificationService.classifyData(classificationRequest: classificationRequest) { result, classificationResponse in
            if result.error != nil {
                completionHandler(result)
            } else {
                if let classificationResponse = classificationResponse {
                    self.classificationResponse = classificationResponse
                    completionHandler(FetchResult(error: nil))
                } else {
                    completionHandler(FetchResult(error: .unknownError))
                }
            }
        }
    }
    
    // MARK: - Functions
    
    func classificationResult() -> String {
        // TODO: Maping 
        if let classificationResponse = classificationResponse {
            return classificationResponse.classificaton
        }
        return ""
    }
    
    func processData(completionHandler: (_ complete: Bool) -> ()) {
        fetchData { complete in
            if complete {
                var index = 0
                while let item = driveItemData.item(at: index) {
                    appendDriveItemData(item: item, index: index)
                    index += 4
                }
                calculateDeltaValues()
            }
        }
    }
    
    fileprivate func fetchData(completionHandler: (_ complete: Bool) -> ()) {
        do {
            let realm = try Realm()
            driveItemData = Array(realm.objects(DriveItemData.self))
            completionHandler(true)
        } catch _ {
            print("Fetch data failed.")
            completionHandler(false)
        }
    }
    
    func convertDataToSVM() -> String {
        var engineSpeedRangeInvalid = 0
        var vehicleSpeedRangeUpInvalid = 0
        var vehicleSpeedRangeDownInvalid = 0
        var vehicleEngineSpeedRangeInvalid = 0
        var engineLoadRangeInvalid = 0
        var fuelRailPressureRangeInvalid = 0

        var vehicleSpeedUpExceeded = 0
        var vehicleSpeedDownExceeded = 0
        var engineSpeedExceeded = 0
        var fuelRailPressureExceeded: Float = 0.0
        
        var driveStyle: DriveStyle = .optimal
        var dataListCSV = ""
        
        for item in calculatedData {
            
            if let driveStyleItem = item.driveStyle {
                driveStyle = driveStyleItem
            }
            /* Engine speed */
            if !item.engineSpeedCorrect {
                engineSpeedRangeInvalid += 1
                engineSpeedExceeded += item.engineSpeedExeeded
            }
            
            /* Vehicle speed */
            if !item.vehicleSpeedUpCorrect {
                vehicleSpeedRangeUpInvalid += 1
                vehicleSpeedUpExceeded += item.vehicleSpeedUpExeeded
            }
            if !item.vehicleSpeedDownCorrect {
                vehicleSpeedRangeDownInvalid += 1
                vehicleSpeedDownExceeded += item.vehicleSpeedDownExeeded
            }
            
            /* Fuel Rail Pressure */
            if !item.fuelRailPressureRatioCorrect {
                fuelRailPressureRangeInvalid += 1
                fuelRailPressureExceeded += item.fuelRailPressureRatioExeeded
            }
            
            /* Engine load */
            if !item.engineLoadCorrect {
                engineLoadRangeInvalid += 1
            }
            
            /* Vehicle engine speed ratio */
            if !item.fuelRailPressureRatioCorrect {
                vehicleEngineSpeedRangeInvalid += 1
            }
            if let itemCSV = item.convertItemToCSVItem() {
                dataListCSV += itemCSV
            }
        }
        
        let calculatedDataElements = calculatedData.count.float
        
        let engineSpeedRangeInvalidParam = engineSpeedRangeInvalid.float / calculatedDataElements * 100
        let vehicleSpeedRangeInvalidParam = (vehicleSpeedRangeUpInvalid + vehicleSpeedRangeDownInvalid).float / calculatedDataElements * 100
        let vehicleEngineSpeedRangeInvalidParam = vehicleEngineSpeedRangeInvalid.float / calculatedDataElements * 100
        let engineLoadRangeInvalidParam = engineLoadRangeInvalid.float / calculatedDataElements * 100
        let fuelRailPressureRangeInvalidParam = fuelRailPressureRangeInvalid.float / calculatedDataElements * 100
        
        var vehicleSpeedUpExceededAverage: Float = 0
        var vehicleSpeedDownExceededAverage: Float = 0
        var engineSpeedExceededAverage: Float = 0
        var fuelRailPressureExceededAverage: Float = 0
        
        if vehicleSpeedRangeUpInvalid != 0 {
            vehicleSpeedUpExceededAverage = vehicleSpeedUpExceeded.float / vehicleSpeedRangeUpInvalid.float
        }
        
        if vehicleSpeedRangeDownInvalid != 0 {
            vehicleSpeedDownExceededAverage = vehicleSpeedDownExceeded.float / vehicleSpeedRangeDownInvalid.float
        }
        
        if engineSpeedRangeInvalid != 0 {
            engineSpeedExceededAverage = engineSpeedExceeded.float / engineSpeedRangeInvalid.float
        }
        
        if fuelRailPressureRangeInvalid != 0 {
            fuelRailPressureExceededAverage = fuelRailPressureExceeded / fuelRailPressureRangeInvalid.float
        }
        
        return "\(driveStyle.rawValue), 1:\(engineSpeedRangeInvalidParam), 2:\(vehicleSpeedRangeInvalidParam), 3:\(vehicleEngineSpeedRangeInvalidParam), 4:\(engineLoadRangeInvalidParam), 5:\(fuelRailPressureRangeInvalidParam), 6:\(vehicleSpeedUpExceededAverage), 7:\(vehicleSpeedDownExceededAverage), 8:\(engineSpeedExceededAverage), 9:\(fuelRailPressureExceededAverage)"

        // Option with sending with full drive history
//        return "\(driveStyle.rawValue), 1:\(engineSpeedRangeInvalidParam), 2:\(vehicleSpeedRangeInvalidParam), 3:\(vehicleEngineSpeedRangeInvalidParam), 4:\(engineLoadRangeInvalidParam), 5:\(fuelRailPressureRangeInvalidParam), 6:\(vehicleSpeedUpExceededAverage), 7:\(vehicleSpeedDownExceededAverage), 8:\(engineSpeedExceededAverage), 9:\(fuelRailPressureExceededAverage) \n \(dataListCSV)"
    }
    
    fileprivate func appendDriveItemData(item: DriveItemData, index: Int) {
        var vehicleSpeed: Float?
        var engineSpeed: Float?
        var engineLoad: Float?
        var fuelRailPressure: Float?
        
        if item.dataTypeEnum == .vehicleSpeed {
            vehicleSpeed = item.value
        }
        
        if let nextItem = driveItemData.item(at: index + 1), nextItem.dataTypeEnum == .engineSpeed {
            engineSpeed = nextItem.value
        }
        
        if let nextItem = driveItemData.item(at: index + 2), nextItem.dataTypeEnum == .engineLoad {
            engineLoad = nextItem.value
        }
        
        if let nextItem = driveItemData.item(at: index + 3), nextItem.dataTypeEnum == .fuelRailPressure {
            fuelRailPressure = nextItem.value
        }
        if let vehicleSpeed = vehicleSpeed, let engineSpeed = engineSpeed, let engineLoad = engineLoad, let fuelRailPressure = fuelRailPressure {
            let calculatedDriveItem = CalculatedDriveItem(engineSpeed: engineSpeed.int, vehicleSpeed: vehicleSpeed.int, engineLoad: engineLoad,
                                                          fuelRailPressure: fuelRailPressure.int, timestamp: item.timestamp, position: (lat: item.lat, lng: item.lng), driveStyle: item.driveStyleEnum)
            //TODO: Mock
            calculatedDriveItem.calculateVehicleEngineSpeedRatio(maxVehicleSpeed: 180, maxRPM: 4500)
            calculatedDriveItem.calculateFuelRailPressureRatio(baseFuelRailPressure: 26000)
            calculatedData.append(calculatedDriveItem)
        }
    }
    
    fileprivate func calculateDeltaValues() -> (maxDeltaRPM: Float, maxDeltaVehicleSpeed: Float) {
        var maxDeltaRPM = 0
        var maxDeltaVehicleSpeed = 0
        
        var index = 1
        while let currentItem = calculatedData.item(at: index), let previousItem = calculatedData.item(at: index - 1) {
            let currentDeltaRPM = currentItem.engineSpeed - previousItem.engineSpeed
            currentItem.engineSpeedDelta = currentDeltaRPM
            if currentDeltaRPM > maxDeltaRPM {
                maxDeltaRPM = currentDeltaRPM
            }
            
            let currentVehicleSpeed = currentItem.vehicleSpeed - previousItem.vehicleSpeed
            currentItem.vehicleSpeedDelta = currentVehicleSpeed
            if currentVehicleSpeed > maxDeltaVehicleSpeed {
                maxDeltaVehicleSpeed = currentVehicleSpeed
            }
            currentItem.calculateRangeOfValues()
            index += 1
        }
        return (maxDeltaRPM: maxDeltaRPM.float, maxDeltaVehicleSpeed: maxDeltaVehicleSpeed.float)
    }
}


