//
//  String.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 12/6/17
//  Copyright (c) 2017 Pkuzia. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
