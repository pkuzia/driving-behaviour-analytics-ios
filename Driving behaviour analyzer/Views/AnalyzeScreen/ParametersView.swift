//
//  ParametersView.swift
//  Driving behaviour analyzer
//
//  Created by prkuz1 on 04.06.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class ParametersView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var vehicleSpeed: UILabel!
    @IBOutlet weak var engineSpeed: UILabel!
    @IBOutlet weak var pressureValue: UILabel!
    @IBOutlet weak var engineLoadValue: UILabel!
    
    // MARK: - Initialization
    
    func initView() {
        vehicleSpeed.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
        engineSpeed.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
        engineLoadValue.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
        pressureValue.attributedText = StyleKit.attributedText(text: "-", attribute: .calculatedDriveValueLabel)
    }
}
