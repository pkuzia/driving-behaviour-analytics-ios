//
//  CollectTableViewDriveDataViewModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 28.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import RealmSwift

protocol CollectTableViewDriveDataViewModelDelegate: class {
    
}

class CollectTableViewDriveDataViewModel: BaseViewModel {
    
    // MARK: - Strings
    
    // MARK: - View Model Data
    
    let driveItemCellID = "driveItemCell"
    let driveItemHeaderCellID = "driveItemHeaderCell"
    let screenTitle = "collect_table_view_title".localized
    
    var driveItemData: [DriveItemData]?
    
    let driveItemCellSize: CGFloat = 65
    let driveItemCellHeaderSize: CGFloat = 55
    
    weak var delegate: CollectTableViewDriveDataViewModelDelegate?
    
    // MARK: - Functions
    
    func fetchData(completionHandler: (_ complete: Bool) -> ()) {
        do {
            let realm = try Realm()
            driveItemData = Array(realm.objects(DriveItemData.self))
            completionHandler(true)
        } catch _ {
            print("Fetch data failed.")
            completionHandler(false)
        }
    }
}


