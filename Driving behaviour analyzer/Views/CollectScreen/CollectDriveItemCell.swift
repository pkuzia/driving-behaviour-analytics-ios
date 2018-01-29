//
//  CollectDriveItemCell.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 28.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class CollectDriveItemCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var driveValue: UILabel!
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lngLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var driveStyleLabel: UILabel!
    
    var dayTimePeriodFormatter: DateFormatter?
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    // MARK: - Functions
    
    fileprivate func initUI() {
        selectionStyle = .none
        dayTimePeriodFormatter = DateFormatter()
        if let dayTimePeriodFormatter = dayTimePeriodFormatter {
            dayTimePeriodFormatter.dateFormat = "yyyy-MM-dd \n HH:mm.SSSS"
        }
    }
    
    func initCellWithData(_ driveItemData: DriveItemData) {
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.attributedText = StyleKit.attributedText(text: driveItemData.dataType, attribute: .collectDriveValueLabel)
        driveValue.attributedText = StyleKit.attributedText(text: driveItemData.value.string, attribute: .collectDriveItemData)
        
        latLabel.attributedText = StyleKit.attributedText(text: driveItemData.lat.string, attribute: .collectDriveItemData)
        lngLabel.attributedText = StyleKit.attributedText(text: driveItemData.lng.string, attribute: .collectDriveItemData)
        
        let timestamp = driveItemData.timestamp.double / 1000
        if let dateString = dayTimePeriodFormatter?.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp))) {
            timeLabel.attributedText = StyleKit.attributedText(text: dateString, attribute: .collectDriveItemData)
        }
        
        driveStyleLabel.attributedText = StyleKit.attributedText(text: driveItemData.driveStyle, attribute: .collectDriveItemData)
    }

}
