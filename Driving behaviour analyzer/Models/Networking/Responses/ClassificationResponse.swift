//
//  ClassificationResponse.swift
//  Driving behaviour analyzer
//
//  Created by prkuz1 on 26.06.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class ClassificationResponse: BaseResponseModel {
    
    dynamic var classificaton: String = ""
    
    // MARK: - Database
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }
    
    // MARK: - Mapping
    
    override public func mapping(map: Map) {
        classificaton <- map["classificaton"]
    }
}
