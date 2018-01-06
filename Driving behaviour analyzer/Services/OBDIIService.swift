//
//  OBDIIService.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 25.12.2017.
//  Copyright © 2017 Pkuzia. All rights reserved.
//

import Foundation
import OBD2

protocol OBDIIServiceDelegate {
    func stateChanged(state: ScanState)
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
        
        observer.observe(command: .pid(number: 4)) { (descriptor) in
            let respStr = descriptor?.shortDescription
            print(descriptor?.valueMetrics)
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
    
    func requestSpeed() {
        let command = Command.Mode01.pid(number: 4)
        if obd.isRepeating(repeat: command) {
//            sender.setTitle("Start repeat speed", for: .normal)
            obd.stop(repeat: command)
        } else {
//            sender.setTitle("Stop repeat", for: .normal)
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
    
    fileprivate func onOBD(change state: ScanState) {
        obdIIServiceDelegate?.stateChanged(state: state)
    }
}
