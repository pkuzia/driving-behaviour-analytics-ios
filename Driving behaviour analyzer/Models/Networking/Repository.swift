//
//  Repository.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 12/6/17
//  Copyright (c) 2017 Pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

public class Repository: BaseModel {
    
    dynamic var ID = ""
    dynamic var statusesURL = ""
    
    override public static func primaryKey() -> String? {
        return "ID"
    }
    
    override public func mapping(map: Map) {
        ID <- map["ID"]
        statusesURL <- map["statuses_url"]
    }
    
    
}
