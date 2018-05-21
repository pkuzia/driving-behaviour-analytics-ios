//
//  DataGeneratorViewController.swift
//  Driving behaviour analyzer
//
//  Created by prkuz1 on 21.05.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import MessageUI

class DataGeneratorViewController: BaseViewController {
    
    // MARK: - Outlets
    
    let dataGeneratorViewModel = DataGeneratorViewModel()
    
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
        let CSV = dataGeneratorViewModel.generateData()
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([])
        mailVC.setSubject("Driving Behavior analyzer CSV")
        mailVC.setMessageBody(CSV, isHTML: false)
        
        present(mailVC, animated: true, completion: nil)
    }
    
    // MARK: - User Interaction
    
    // MARK: - Additional Helpers

}

// MARK: - DataGeneratorViewModelDelegate

extension DataGeneratorViewController: DataGeneratorViewModelDelegate {
    
}

// MARK: - MFMailComposeViewControllerDelegate

extension DataGeneratorViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}


