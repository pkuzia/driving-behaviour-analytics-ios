//
//  CalculatedDataCell.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 29.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class CalculatedDataCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var engineSpeedValue: UILabel!
    @IBOutlet weak var vehicleSpeedValue: UILabel!
    @IBOutlet weak var engineLoadValue: UILabel!
    @IBOutlet weak var pressureValue: UILabel!
    
    @IBOutlet weak var vehicleEngineSpeedRatio: UILabel!
    @IBOutlet weak var vehicleSpeedDelta: UILabel!
    @IBOutlet weak var engineSpeedDelta: UILabel!
    @IBOutlet weak var fuelRailPressureRatio: UILabel!
    
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var time: UILabel!
    
    var dayTimePeriodFormatter: DateFormatter?
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    fileprivate func initUI() {
        selectionStyle = .none
        dayTimePeriodFormatter = DateFormatter()
        if let dayTimePeriodFormatter = dayTimePeriodFormatter {
            dayTimePeriodFormatter.dateFormat = "dd-MM\nH:m:ss.SSS"
        }
    }
    
    // MARK: - Functions
    
    func initCellWithData(_ calculatedDriveItem: CalculatedDriveItem) {
        engineSpeedValue.attributedText = StyleKit.attributedText(text: "\(calculatedDriveItem.engineSpeed) RPM",
                                                                  attribute: .calculatedDriveValueLabel)
        vehicleSpeedValue.attributedText = StyleKit.attributedText(text: "\(calculatedDriveItem.vehicleSpeed) km/h",
                                                                   attribute: .calculatedDriveValueLabel)
        position.attributedText = StyleKit.attributedText(text: String(format: "%.04f", calculatedDriveItem.position.lat) + ",\n" +
            String(format: "%.04f", calculatedDriveItem.position.lng), attribute: .calculatedDriveValueLabel)
        pressureValue.attributedText = StyleKit.attributedText(text: "\(calculatedDriveItem.fuelRailPressure) kPa",
            attribute: .calculatedDriveValueLabel)
        
        let timestamp = calculatedDriveItem.timestamp.double / 1000
        if let dateString = dayTimePeriodFormatter?.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp))) {
            time.attributedText = StyleKit.attributedText(text: dateString, attribute: .calculatedDriveValueLabel)
        }
        
        if let fuelRailPressureRatioValue = calculatedDriveItem.fuelRailPressureRatio {
            if calculatedDriveItem.fuelRailPressureRatioCorrect {
                fuelRailPressureRatio.attributedText = StyleKit.attributedText(text: String(format: "%.03f", fuelRailPressureRatioValue),
                    attribute: .calculatedDriveValueLabel)
            } else {
            fuelRailPressureRatio.attributedText = StyleKit.attributedText(text: String(format: "%.03f", fuelRailPressureRatioValue),
                attribute: .calculatedDriveValueLabelRed)
            }
        }
        
        if let vehicleEngineSpeedRatioValue = calculatedDriveItem.vehicleEngineSpeedRatio {
            if calculatedDriveItem.vehicleEngineSpeedRatioCorrect {
                vehicleEngineSpeedRatio.attributedText = StyleKit.attributedText(text: String(format: "%.02f", vehicleEngineSpeedRatioValue),
                                                                                 attribute: .calculatedDriveValueLabel)
            } else {
                vehicleEngineSpeedRatio.attributedText = StyleKit.attributedText(text: String(format: "%.02f", vehicleEngineSpeedRatioValue),
                                                                                 attribute: .calculatedDriveValueLabelRed)
            }
        } else {
            vehicleEngineSpeedRatio.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
        }
        
        if let vehicleSpeedDeltaValue = calculatedDriveItem.vehicleSpeedDelta {
            if calculatedDriveItem.vehicleSpeedCorrect {
                vehicleSpeedDelta.attributedText = StyleKit.attributedText(text:  "\(vehicleSpeedDeltaValue) km/h",
                    attribute: .calculatedDriveValueLabel)
            } else {
                vehicleSpeedDelta.attributedText = StyleKit.attributedText(text:  "\(vehicleSpeedDeltaValue) km/h",
                    attribute: .calculatedDriveValueLabelRed)
            }
        } else {
            vehicleSpeedDelta.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
        }
        
        if let engineSpeedDeltaValue = calculatedDriveItem.engineSpeedDelta {
            if calculatedDriveItem.engineSpeedCorrect {
                engineSpeedDelta.attributedText = StyleKit.attributedText(text: "\(engineSpeedDeltaValue) RPM",
                    attribute: .calculatedDriveValueLabel)
            } else {
                engineSpeedDelta.attributedText = StyleKit.attributedText(text: "\(engineSpeedDeltaValue) RPM",
                    attribute: .calculatedDriveValueLabelRed)
            }
        } else {
            engineSpeedDelta.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
        }
        
        if calculatedDriveItem.engineLoadCorrect {
            engineLoadValue.attributedText = StyleKit.attributedText(text: String(format: "%.02f", calculatedDriveItem.engineLoad),
                                                                     attribute: .calculatedDriveValueLabel)
        } else {
            engineLoadValue.attributedText = StyleKit.attributedText(text: String(format: "%.02f", calculatedDriveItem.engineLoad),
                                                                     attribute: .calculatedDriveValueLabelRed)
        }
    }
}
