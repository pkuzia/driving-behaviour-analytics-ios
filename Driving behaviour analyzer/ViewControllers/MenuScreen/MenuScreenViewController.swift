//
//  MenuScreenViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 21.12.2017.
//Copyright © 2017 Pkuzia. All rights reserved.
//

import UIKit
import SwifterSwift

class MenuScreenViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var analyzeButton: UIButton!
    @IBOutlet weak var collectButton: UIButton!
    
    let menuScreenViewModel = MenuScreenViewModel()
    
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
        analyzeButton.backgroundColor = StyleKit.colorType(color: .baseBlueColor)
        analyzeButton.layer.cornerRadius = analyzeButton.frame.height / 2
        analyzeButton.setAttributedTitle(StyleKit.attributedText(text: menuScreenViewModel.analyzeButtonTitle,
                                                                 attribute: .menuButton), for: .normal)
        
        collectButton.backgroundColor = StyleKit.colorType(color: .baseBlueColor)
        collectButton.layer.cornerRadius = analyzeButton.frame.height / 2
        collectButton.setAttributedTitle(StyleKit.attributedText(text: menuScreenViewModel.collectButtonTitle,
                                                                 attribute: .menuButton), for: .normal)
    }
    
    // MARK: - User Interaction
    
    @IBAction func clickCollectButtonHandler(_ sender: Any) {
        
    }
    // MARK: - Additional Helpers
    
}

// MARK: - MenuScreenViewControllerViewModelDelegate

extension MenuScreenViewController: MenuScreenViewModelDelegate {
    
}

