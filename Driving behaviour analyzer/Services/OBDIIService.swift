//
//  OBDIIService.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 25.12.2017.
//  Copyright © 2017 Pkuzia. All rights reserved.
//

import Foundation
import OBD2

class OBDIIService: BaseService {
    
    // MARK: - Variables
    
    let host = "192.168.0.10"
    let port = 35000
    
    let obd = OBD2()
    
    // MARK: - Functions
    
    func initOBD() {
        let observer = Observer<Command.Mode01>()
        
        observer.observe(command: .pid(number: 4)) { (descriptor) in
            let respStr = descriptor?.shortDescription
            descriptor.
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
        switch state {
        case .none:
//            indicator.stopAnimating()
//            statusLabel.text = "Not Connected"
//            updateUI(connected: false)
            break
        case .connected:
//            indicator.stopAnimating()
//            statusLabel.text = "Connected"
//            updateUI(connected: true)
            break
        case .openingConnection:
//            connectButton.isHidden = true
//            indicator.startAnimating()
//            statusLabel.text = "Opening connection"
            break
        case .initializing:
//            statusLabel.text = "Initializing"
            break
        }
    }
}
