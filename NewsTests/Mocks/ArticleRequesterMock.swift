//
//  ArticleRequesterMock.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
@testable import News

class ArticleRequesterMock: ArticleRequesterProtocol {
    
    var articleList: [Article]?
    var error: Error?
    var source: String?
    
    func getArticleList(source: String, responseCompletion: ReponseArticleListCompletion) {
        self.source = source
        responseCompletion(articleList, error)
    }
}
