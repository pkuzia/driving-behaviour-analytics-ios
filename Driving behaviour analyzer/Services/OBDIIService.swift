//
//  OBDIIService.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 25.12.2017.
//  Copyright © 2017 Pkuzia. All rights reserved.
//

import Foundation
import OBD2
import RealmSwift

protocol OBDIIServiceDelegate {
    func stateChanged(state: ScanState)
    func valueRecieved(type: DataType, value: String)
}

class OBDIIService: BaseService {
    
    // MARK: - Variables
    
    let host = "192.168.0.10"
    let port = 35000
    
    let obd = OBD2()
    var obdIIServiceDelegate: OBDIIServiceDelegate?
    
    // MARK: - Functions
    
    func initOBD() {
        let observer = Observer<Command.Mode01>()
        
        /* Observer for params */
        observer.observe(command: .pid(number: 13)) { descriptor in
            print("Vehicle speed: \(descriptor?.valueMetrics)")
            self.saveToDB(dataType: .vehicleSpeed, value: descriptor?.valueMetrics)
        }
        observer.observe(command: .pid(number: 12)) { descriptor in
            print("RPM: \(descriptor?.valueMetrics)")
            self.saveToDB(dataType: .engineSpeed, value: descriptor?.valueMetrics)
        }
        
        observer.observe(command: .pid(number: 4)) { descriptor in
            print("Engine load: \(descriptor?.valueMetrics)")
            self.saveToDB(dataType: .engineLoad, value: descriptor?.valueMetrics)
        }
        
        observer.observe(command: .pid(number: 35)) { descriptor in
            print("Fuel Rail Pressure: \(descriptor?.valueMetrics)")
            self.saveToDB(dataType: .fuelRailPressure, value: descriptor?.valueMetrics)
        }
        
        ObserverQueue.shared.register(observer: observer)
        
        obd.stateChanged = { state in
            OperationQueue.main.addOperation { [weak self] in
                self?.onOBD(change: state)
            }
        }
    }
    
    func pauseOBD() {
        obd.pauseScan()
    }
    
    func resumeOBD() {
        obd.resumeScan()
    }
    
    func requestParameters() {
        
        /* Vehicle speed */
        var command = Command.Mode01.pid(number: 13)
        if obd.isRepeating(repeat: command) {
            obd.stop(repeat: command)
        } else {
            obd.request(repeat: command)
        }
        
        /* Engine speed */
        command = Command.Mode01.pid(number: 12)
        if obd.isRepeating(repeat: command) {
            obd.stop(repeat: command)
        } else {
            obd.request(repeat: command)
        }

        /* Engine load */
        command = Command.Mode01.pid(number: 4)
        if obd.isRepeating(repeat: command) {
            obd.stop(repeat: command)
        } else {
            obd.request(repeat: command)
        }

        /* Fuel Rail Pressure */
        command = Command.Mode01.pid(number: 35)
        if obd.isRepeating(repeat: command) {
            obd.stop(repeat: command)
        } else {
            obd.request(repeat: command)
        }
    }
    
    func connectOBD() {
        obd.connect { [weak self] success, error in
            OperationQueue.main.addOperation({
                if let error = error {
                    print("OBD connection failed with \(error)")
                }
            })
        }
    }
    
    
    fileprivate func saveToDB(dataType: DataType, value: Float?) {
        if let value = value {
            
            let driveItemData = DriveItemData()
            driveItemData.dataTypeEnum = dataType
            driveItemData.value = value
            driveItemData.timestamp = Int(NSDate().timeIntervalSince1970 * 1000.0)
            obdIIServiceDelegate?.valueRecieved(type: dataType, value: String(value))
//            do {
//                let realm = try Realm()
//                try realm.write {
//                    realm.add(driveItemData)
//                }
//            } catch _ {
//
//            }
        }
    }
    
    fileprivate func onOBD(change state: ScanState) {
        obdIIServiceDelegate?.stateChanged(state: state)
    }
}
