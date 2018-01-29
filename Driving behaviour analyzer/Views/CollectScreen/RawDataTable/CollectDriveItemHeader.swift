//
//  CollectDriveItemHeader.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 29.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class CollectDriveItemHeader: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var valueHeader: UILabel!
    @IBOutlet weak var locationHeader: UILabel!
    @IBOutlet weak var timeHeader: UILabel!
    @IBOutlet weak var typeHeader: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        initUI()
    }
    
    // MARK: - Functions
    
    fileprivate func initUI() {
        backgroundColor = StyleKit.colorType(color: .baseBlueDarkColor)
        contentView.backgroundColor = StyleKit.colorType(color: .baseBlueDarkColor)
    }
    
    func initCell() {
        valueHeader.attributedText = StyleKit.attributedText(text: "collect_screen_table_value_header".localized,
                                                             attribute: .collectDriveItemHeader)
        locationHeader.attributedText = StyleKit.attributedText(text: "collect_screen_table_location_header".localized,
                                                                attribute: .collectDriveItemHeader)
        timeHeader.attributedText = StyleKit.attributedText(text: "collect_screen_table_time_header".localized,
                                                            attribute: .collectDriveItemHeader)
        typeHeader.attributedText = StyleKit.attributedText(text: "collect_screen_table_type_header".localized,
                                                            attribute: .collectDriveItemHeader)
    }
}
