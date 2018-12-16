//
//  Source.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit
import ObjectMapper

class Source: Mappable {
    
    private let FIELD_ID_KEY = "id"
    private let FIELD_TITLE_KEY = "name"
    private let FIELD_DESCRIPTION_KEY = "description"
    private let FIELD_URL_KEY = "url"
    
    var id: String?
    var title: String?
    var description: String?
    var url: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title       <- map[FIELD_ID_KEY]
        title       <- map[FIELD_TITLE_KEY]
        description <- map[FIELD_DESCRIPTION_KEY]
        url         <- map[FIELD_URL_KEY]
    }
}
