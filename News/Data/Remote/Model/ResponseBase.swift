//
//  Response.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseBase: NSObject, Mappable {
    
    private let FIELD_STATUS_KEY = "status"
    
    var status: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map[FIELD_STATUS_KEY]
    }
}
