//
//  AnalyzeMapScreenViewModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 17.05.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

protocol AnalyzeMapScreenViewModelDelegate: class {
    
}

enum AnalyzeState {
    case idle, connected, drive, stopped
}

class AnalyzeMapScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    let screenTitle = "analyze_screen_title".localized
    let connectButtonTitle = "analyze_connect_button".localized
    let startButtonTitle = "analyze_start_button".localized
    let stopButtonTitle = "analyze_stop_button".localized
    let zeroTime = "00:00"
    
    // MARK: - View Model Data
    
    weak var delegate: AnalyzeMapScreenViewModelDelegate?
    var analyzeState: AnalyzeState = .idle
    let obdIIService = OBDIIService()
    var timer = 0
    
    // MARK: - Functions
    
    func driveTime() -> String {
        let sec = timer % 3600 % 60
        let minutes = timer % 3600 / 60
        return String(format: "%02u:%02u", minutes, sec)
    }
}


