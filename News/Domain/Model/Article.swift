//
//  Article.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
import ObjectMapper

class Article: Mappable {
    
    private let FIELD_TITLE_KEY = "title"
    private let FIELD_DESCRIPTION_KEY = "description"
    private let FIELD_THUMBNAIL_KEY = "urlToImage"
    private let FIELD_AUTHOR_KEY = "author"
    private let FIELD_PUBLISH_DAY_KEY = "publishedAt"
    
    var title: String?
    var description: String?
    var thumbnail: String?
    var author: String?
    var publishDay: String?
    
    static func getFieldKey() -> String {
        return "articles"
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title       <- map[FIELD_TITLE_KEY]
        description <- map[FIELD_DESCRIPTION_KEY]
        thumbnail   <- map[FIELD_THUMBNAIL_KEY]
        author      <- map[FIELD_AUTHOR_KEY]
        publishDay  <- map[FIELD_PUBLISH_DAY_KEY]
    }
}
