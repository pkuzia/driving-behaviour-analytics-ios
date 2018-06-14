//
//  ClassificationRequest.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 14.09.2017.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import Foundation

public class ClassificationRequest: BaseRequestModel {
    
    var elements: [String: Any]
    
    init(elements: [String: Any]) {
        self.elements = elements
    }
    
    fileprivate func getParametersBody() -> [String: Any]? {
        return ["elements": elements]
    }
    
    fileprivate func getParametersQuery() -> [String: Any]? {
        return nil
    }
    
    public func getParameters() -> [String: Any]? {
        var parameters: [String: Any] = [:]
        parameters[queryName] = getParametersQuery()
        parameters[bodyName] = getParametersBody()
        return parameters
    }
}
