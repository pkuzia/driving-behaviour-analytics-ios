//
//  CollectTableViewCalculatedViewController.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 28.01.2018.
//Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import SwifterSwift

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
        
//        let menuButton = UIButton(type: .custom)
//        menuButton.setImage(UIImage(named: "menu"), for: .normal)
//        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        menuButton.addTarget(self, action: #selector(clickMenuButtonHandler), for: .touchUpInside)
//        let leftItems = UIBarButtonItem(customView: menuButton)
//
//        self.navigationItem.setLeftBarButtonItems([leftItems], animated: true)
    }
    
    // MARK: - User Interaction
    
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
