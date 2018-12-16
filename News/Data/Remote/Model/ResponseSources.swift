//
//  ResponseSource.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseSources: ResponseBase {
    
    private let FIELD_SOURCES_KEY = "sources"

    var sources: [Source]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        sources <- map[FIELD_SOURCES_KEY]
    }
}
