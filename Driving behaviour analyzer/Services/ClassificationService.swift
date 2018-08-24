//
//  ClassificationService.swift
//  Driving behaviour analyzer
//
//  Created by prkuz1 on 25.06.2018.
//  Copyright © 2018 Pkuzia. All rights reserved.
//

import Foundation

class ClassificationService: BaseService {
    
    func sendCollectedData(collectDataRequest: CollectDataRequest, completionHandler: @escaping (FetchResult) -> ()) {
        APIProvider.request(.saveCollectData(collectDataRequest)) { result in
            self.handleMoyaResultWitoutMapping(result: result, completionHandler: completionHandler)
        }
    }
    
    func classifyData(classificationRequest: ClassificationRequest, completionHandler: @escaping (FetchResult, ClassificationResponse?) -> ()) {
        APIProvider.request(.classification(classificationRequest)) { result in
            self.handleMoyaResultWithMappingObject(result: result, completionHandler: completionHandler)
        }
    }
}
