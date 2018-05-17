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

class AnalyzeMapScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    let screenTitle = "analyze_screen_title".localized
    
    // MARK: - View Model Data
    
    weak var delegate: AnalyzeMapScreenViewModelDelegate?
    
    // MARK: - Functions
}


