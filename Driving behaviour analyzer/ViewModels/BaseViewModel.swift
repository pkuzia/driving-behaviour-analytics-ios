//
//  BaseViewModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 12/6/17
//  Copyright (c) 2017 Pkuzia. All rights reserved.
//

import UIKit
import SCLAlertView

class BaseViewModel {
    
    // MARK: - View Model Data
    
    let offlineAlertTitle = "offline_alert_title".localized
    let offlineAlertSubtitle = "offline_alert_subtitle".localized
    let offlineAlertButtonTitle = "offline_alert_close_button_title".localized
    
    let errorTitle = "error_alert_title".localized
    let errorSubtitle = "error_alert_subtitle".localized
    
    // MARK: - Functions
    
    func getAlertAppearance() -> SCLAlertView.SCLAppearance {
        return SCLAlertView.SCLAppearance(
            kCircleIconHeight: 23.0,
            kTitleHeight: 50.0
        )
    }
}
