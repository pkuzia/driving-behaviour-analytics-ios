//
//  CollectScreenViewModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 26.12.2017.
//Copyright © 2017 Pkuzia. All rights reserved.
//

import UIKit

protocol CollectScreenViewModelDelegate: class {
    
}

class CollectScreenViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    weak var delegate: CollectScreenViewModelDelegate?
    
    // MARK: - Functions
}


