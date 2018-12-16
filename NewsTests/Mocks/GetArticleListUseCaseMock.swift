//
//  GetArticleListUseCaseMock.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
@testable import News

class GetArticleListUseCaseMock: GetArticleListUseCaseProtocol {
    
    var sourceId: String?
    var articleList: [Article]?
    var error: Error?
    
    func getArticleList(source: String, listener: @escaping GetArticleListCompletion) {
        self.sourceId = source
        listener(articleList, error)
    }
}
