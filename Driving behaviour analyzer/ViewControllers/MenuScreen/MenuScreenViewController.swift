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
        analyzeButton.setBackgroundImage(UIImage(named: "gradient"), for: .normal)
        analyzeButton.layer.cornerRadius = 5
        analyzeButton.setAttributedTitle(StyleKit.attributedText(text: menuScreenViewModel.analyzeButtonTitle,
                                                                 attribute: .menuButton), for: .normal)
        
        collectButton.setBackgroundImage(UIImage(named: "gradient"), for: .normal)
        collectButton.layer.cornerRadius = 5
        collectButton.setAttributedTitle(StyleKit.attributedText(text: menuScreenViewModel.collectButtonTitle,
                                                                 attribute: .menuButton), for: .normal)
    }
    
    // MARK: - User Interaction
    
    @IBAction func clickCollectButtonHandler(_ sender: Any) {
        let storyboard = UIStoryboard(storyboard: .Collect)
        let collectNavigationViewController: CollectNavigationViewController = storyboard.instantiateViewController()
        self.present(collectNavigationViewController, animated: true, completion: nil)
    }
    
    @IBAction func clickAnalyzeButtonHandler(_ sender: Any) {
//        let storyboard = UIStoryboard(storyboard: .Analyze)
//        let analyzeMapNavigationController: AnalyzeMapNavigationController = storyboard.instantiateViewController()
//        self.present(analyzeMapNavigationController, animated: true, completion: nil)
        
        let storyboard = UIStoryboard(storyboard: .Analyze)
        let dataGeneratorViewController: DataGeneratorViewController = storyboard.instantiateViewController()
        self.present(dataGeneratorViewController, animated: true, completion: nil)
    }
    
    // MARK: - Additional Helpers
    
}

// MARK: - MenuScreenViewControllerViewModelDelegate

extension MenuScreenViewController: MenuScreenViewModelDelegate {
    
}

