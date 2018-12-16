//
//  GetArticlesUseCase.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class GetArticleListUseCase: GetArticleListUseCaseProtocol {
    
    private let articleRequester: ArticleRequesterProtocol
    
    init(articleRequester: ArticleRequesterProtocol) {
        self.articleRequester = articleRequester
    }
    
    func getArticle(domains: String, listener: @escaping GetArticleListCompletion) {
        articleRequester.getArticleList(domains: domains, responseCompletion: listener)
    }
}
