//
//  NewsApi.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Alamofire

enum NewsApi: URLRequestConvertible {
    
    private static var baseURL: String {
        get {
            return NetworkConfig.sharedInstance.URL_BASE + NetworkConfig.sharedInstance.URL_VERSION
        }
    }
    
    case getSources
    case getArticles(domains: String)
    
    var endPoint : String {
        
        switch self {
        case .getSources: return "/sources"
        case .getArticles: return "/everything"
        }
    }
    
    var method : HTTPMethod {
        switch self {
        case .getSources: return .get
        case .getArticles: return .get
        }
    }
    
    var params: [String: Any] {
        var params = [NetworkConstants.API_PARAM_KEY: NetworkConfig.sharedInstance.API_KEY as Any]
        
        switch self {
        case .getArticles(let domains):
            params[NetworkConstants.DOMAINS_PARAM_KEY] = domains
            return params
        default:
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try NewsApi.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(endPoint))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        
        return urlRequest
    }
}
