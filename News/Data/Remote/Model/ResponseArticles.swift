//
//  ResponseArticles.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseArticles: ResponseBase {
    
    private let FIELD_SOURCES_KEY = "sources"
    
    var articles: [Article]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        articles <- map[FIELD_SOURCES_KEY]
    }
}
