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
    @IBOutlet weak var vehicleEngineSpeedDeltaRatio: UILabel!
    
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var time: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Functions
    
    func initCellWithData(_ calculatedDriveItem: CalculatedDriveItem) {
        engineSpeedValue.attributedText = StyleKit.attributedText(text: calculatedDriveItem.engineSpeed.string,
                                                                  attribute: .calculatedDriveValueLabel)
        vehicleSpeedValue.attributedText = StyleKit.attributedText(text: calculatedDriveItem.vehicleSpeed.string,
                                                                   attribute: .calculatedDriveValueLabel)
        engineLoadValue.attributedText = StyleKit.attributedText(text: calculatedDriveItem.engineLoad.string,
                                                                 attribute: .calculatedDriveValueLabel)
        pressureValue.attributedText = StyleKit.attributedText(text: calculatedDriveItem.fuelRailPressure.string,
                                                               attribute: .calculatedDriveValueLabel)
        if let vehicleEngineSpeedRatioValue = calculatedDriveItem.vehicleEngineSpeedRatio {
            vehicleEngineSpeedRatio.attributedText = StyleKit.attributedText(text: vehicleEngineSpeedRatioValue.string,
                                                                             attribute: .calculatedDriveValueLabel)
        }
        
        if let vehicleEngineSpeedDeltaRatioValue = calculatedDriveItem.vehicleEngineSpeedDeltaRatio {
            vehicleEngineSpeedDeltaRatio.attributedText = StyleKit.attributedText(text: vehicleEngineSpeedDeltaRatioValue.string,
                                                                             attribute: .calculatedDriveValueLabel)
        }
    }
}
