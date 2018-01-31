//
//  CollectTableViewCalculatedViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 28.01.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import SwifterSwift
import MessageUI

class CollectTableViewCalculatedViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    let collectTableViewCalculatedViewModel = CollectTableViewCalculatedViewModel()
    
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
        collectTableViewCalculatedViewModel.processData { complete in
            if complete {
                tableView.reloadData()
            }
        }
    }

    // MARK: - Appearance
    
    func initUI() {
        initNavBar()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    fileprivate func initNavBar() {
        title = collectTableViewCalculatedViewModel.screenTitle
        navigationController?.navigationBar.titleTextAttributes = StyleKit.navBarAttributes()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        let csvButton = UIButton(type: .custom)
        csvButton.titleForNormal = collectTableViewCalculatedViewModel.csvButtonTitle
//        csvButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        csvButton.addTarget(self, action: #selector(clickCSVButtonHandler), for: .touchUpInside)
        let rightItems = UIBarButtonItem(customView: csvButton)
        
        self.navigationItem.setRightBarButtonItems([rightItems], animated: true)
    }
    
    // MARK: - User Interaction
    
    func clickCSVButtonHandler() {
        let CSV = collectTableViewCalculatedViewModel.convertDataToCSV()
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([])
        mailVC.setSubject("Driving Behavior analyzer CSV")
        mailVC.setMessageBody(CSV, isHTML: false)

        present(mailVC, animated: true, completion: nil)
    }
    
    // MARK: - Additional Helpers
    
}

// MARK: - CollectTableViewCalculatedViewModelDelegate

extension CollectTableViewCalculatedViewController: CollectTableViewCalculatedViewModelDelegate {
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CollectTableViewCalculatedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectTableViewCalculatedViewModel.calculatedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: collectTableViewCalculatedViewModel.calculatedDataCellID,
                                                    for: indexPath) as? CalculatedDataCell {
            if let calculatedDriveItem = collectTableViewCalculatedViewModel.calculatedData.item(at: indexPath.row) {
                cell.initCellWithData(calculatedDriveItem)
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: collectTableViewCalculatedViewModel.calculatedDataHeaderID) as? CalculatedDataHeader {
            cell.initCell()
            return cell
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return collectTableViewCalculatedViewModel.calculatedDataCellSize
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return collectTableViewCalculatedViewModel.calculatedDataHeaderSize
    }
}

// MARK: - MFMailComposeViewControllerDelegate

extension CollectTableViewCalculatedViewController: MFMailComposeViewControllerDelegate {
    
}
