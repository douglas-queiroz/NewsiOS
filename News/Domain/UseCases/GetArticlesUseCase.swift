//
//  GetArticlesUseCase.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class GetArticlesUseCase: GetArticlesUseCaseProtocol {
    
    private let articleRequester: ArticleRequesterProtocol
    
    init(articleRequester: ArticleRequesterProtocol) {
        self.articleRequester = articleRequester
    }
    
    func getArticle(listener: GetArticleListCompletion) {
        articleRequester.getArticleList(response: listener)
    }
}
