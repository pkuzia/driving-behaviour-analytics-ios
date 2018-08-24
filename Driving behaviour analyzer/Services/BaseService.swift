//
//  BaseService.swift
//  Driving behaviour analyzer
//
//  Created by Przemysław Kuzia on 12/6/17
//  Copyright (c) 2017 Pkuzia. All rights reserved.
//

import Foundation
import RealmSwift
import Moya
import Result
import Moya_ObjectMapper

public struct FetchResult {
    let error: FetchError?
}

enum FetchError: Swift.Error {
    case connectionError
    case parseError
    case unknownError
    case errorMessage(String)
    
    var description: String {
        switch self {
        case .connectionError:
            return "There was an connection error"
        case .errorMessage(let error):
            return error
        case .parseError:
            return "There was an parsing error"
        case .unknownError:
            return "There was an unknown error"
        }
    }
}

class BaseService {
    
    func handleMoyaResultWithMappingObject<T: BaseResponseModel>(result: Result<Moya.Response, MoyaError>,
                                                                 completionHandler: @escaping (FetchResult, T?) -> ()) {
        switch result {
        case let .success(response):
            do {
                let validResponse = try response.filterSuccessfulStatusCodes()
                let response: T? = try validResponse.mapObject(T.self)
                
                if let response = response {
                    completionHandler(FetchResult(error: nil), response)
                } else {
                    completionHandler(FetchResult(error: .parseError), nil)
                }
            } catch let error as MoyaError {
                switch error {
                case .statusCode(_): do {
                    completionHandler(FetchResult(error: .connectionError), nil)
                    }
                case .jsonMapping(_): do {
                    completionHandler(FetchResult(error: .parseError), nil)
                    }
                default:
                    completionHandler(FetchResult(error: .unknownError), nil)
                }
            }
            catch {
                completionHandler(FetchResult(error: .unknownError), nil)
            }
        case let .failure(error):
            guard let error = error.errorDescription else {
                completionHandler(FetchResult(error: .errorMessage("Request failure")), nil)
                return
            }
            completionHandler(FetchResult(error: .errorMessage(error.description)), nil)
        }
    }
    
    func handleMoyaResultWitoutMapping(result: Result<Moya.Response, MoyaError>,
                                       completionHandler: @escaping (FetchResult) -> ()) {
        switch result {
        case let .success(response):
            do {
                _ = try response.filterSuccessfulStatusCodes()
                completionHandler(FetchResult(error: nil))
            } catch let error as MoyaError {
                switch error {
                case .statusCode(_): do {
                    completionHandler(FetchResult(error: .connectionError))
                    }
                default:
                    completionHandler(FetchResult(error: .unknownError))
                }
            }
            catch {
                completionHandler(FetchResult(error: .unknownError))
            }
        case let .failure(error):
            guard let error = error.errorDescription else {
                completionHandler(FetchResult(error: .unknownError))
                break
            }
            completionHandler(FetchResult(error: .errorMessage(error.description)))
        }
    }
}
