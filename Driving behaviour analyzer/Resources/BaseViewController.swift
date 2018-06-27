//
//  BaseViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 12/6/17
//  Copyright (c) 2017 Pkuzia. All rights reserved.
//

import UIKit
import SCLAlertView

class BaseViewController: UIViewController {

    let baseViewModel = BaseViewModel()
    
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
    }
    
    // MARK: - Functions
    
    func showConnectionErrorAlert() {
        let appearance = baseViewModel.getAlertAppearance()
        
        let alertColor = StyleKit.colorType(color: .connectionErrorColor)
        let alert = SCLAlertView(appearance: appearance)
        alert.showEdit(baseViewModel.offlineAlertTitle,
                       subTitle: baseViewModel.offlineAlertSubtitle,
                       closeButtonTitle: baseViewModel.offlineAlertButtonTitle, timeout: nil,
                       colorStyle: alertColor.uInt, colorTextButton: UIColor.white.uInt)
    }

}
