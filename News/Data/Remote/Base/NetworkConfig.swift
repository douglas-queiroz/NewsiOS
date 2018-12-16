//
//  NetworkConfig.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class NetworkConfig {
    
    private var serviceConfig: Dictionary<String, Any?>!
    private static var _sharedInstance: NetworkConfig?
    static var sharedInstance: NetworkConfig {
        get {
            if _sharedInstance == nil {
                let path = Bundle.main.path(forResource: "Environment", ofType: "plist")!
                let nsDictionary = NSDictionary(contentsOfFile: path)!
                _sharedInstance = self.init(dic: nsDictionary)
            }
            
            return _sharedInstance!
        }
    }
    
    internal required init(dic: NSDictionary) {
        serviceConfig = dic["Service"] as? Dictionary<String, Any?>
    }
    
    var URL_BASE : String {
        get {
            return serviceConfig["UrlBase"] as! String
        }
    }
    
    var URL_VERSION : String {
        get {
            return serviceConfig["Version"] as! String
        }
    }
    
    var API_KEY: String {
        get {
            return serviceConfig["ApiKey"] as! String
        }
    }
}
