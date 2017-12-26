//
//  MenuScreenViewModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 21.12.2017.
//Copyright © 2017 Pkuzia. All rights reserved.
//

import UIKit

protocol MenuScreenViewModelDelegate: class {
    
}

class MenuScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    let analyzeButtonTitle = "analyze_button_title".localized
    let collectButtonTitle = "collect_button_title".localized
    
    // MARK: - View Model Data
    
    weak var delegate: MenuScreenViewModelDelegate?
    
    // MARK: - Functions
}


