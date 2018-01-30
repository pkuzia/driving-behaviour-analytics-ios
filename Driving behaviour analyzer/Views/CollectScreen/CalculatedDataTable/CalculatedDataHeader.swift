//
//  CalculatedDataHeader.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 29.01.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit

class CalculatedDataHeader: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var vehicleDataColumn: UILabel!
    @IBOutlet weak var vehicleDataCalculatedColumn: UILabel!
    @IBOutlet weak var envColumn: UILabel!
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Functions
    
    func initCell() {
        vehicleDataColumn.attributedText = StyleKit.attributedText(text: "collect_calculated_table_view_data_header".localized,
                                                             attribute: .collectDriveItemHeader)
        vehicleDataCalculatedColumn.attributedText = StyleKit.attributedText(text: "collect_calculated_table_view_ratio_header".localized,
                                                                attribute: .collectDriveItemHeader)
        envColumn.attributedText = StyleKit.attributedText(text: "collect_calculated_table_view_env_header".localized,
                                                            attribute: .collectDriveItemHeader)
    }
}
