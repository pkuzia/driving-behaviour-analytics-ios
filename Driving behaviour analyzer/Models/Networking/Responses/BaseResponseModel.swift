//
//  BaseModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 7/29/17
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper
import Realm

public class BaseResponseModel: Object, Mappable {
    
    var objects: List<BaseResponseModel>?
    private(set) dynamic var uuid = NSUUID().uuidString
    
    required public init?(map: Map) {
        super.init()
    }
    
    required public init() {
        super.init()
    }
    
    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    public func mapping(map: Map) {
    }
}
