//
//  DataGeneratorViewController.swift
//  Driving behaviour analyzer
//
//  Created by prkuz1 on 21.05.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class DataGeneratorViewController: BaseViewController {
    
    // MARK: - Outlets
    
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

// MARK: - DataGeneratorViewModelDelegate

extension DataGeneratorViewController: DataGeneratorViewModelDelegate {
    
}

