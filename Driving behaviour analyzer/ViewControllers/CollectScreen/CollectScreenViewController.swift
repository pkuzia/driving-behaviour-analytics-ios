//
//  CollectScreenViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 26.12.2017.
//Copyright © 2017 Pkuzia. All rights reserved.
//

import UIKit

class CollectScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    let collectScreenViewModel = CollectScreenViewModel()
    
    // MARK: - View Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    // MARK: - Appearance
    
    func initUI() {
        
    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers
    
}

// MARK: - CollectScreenViewControllerViewModelDelegate

extension CollectScreenViewController: CollectScreenViewModelDelegate {
    
}

