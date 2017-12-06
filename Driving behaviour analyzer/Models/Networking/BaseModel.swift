//
//  BaseModel.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 12/6/17
//  Copyright (c) 2017 Pkuzia. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper
import Realm

public class BaseModel: Object, Mappable {
    
    var objects: List<BaseModel>?
    
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
