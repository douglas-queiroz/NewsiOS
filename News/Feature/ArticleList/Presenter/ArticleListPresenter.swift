//
//  ArticleListPresenter.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class ArticleListPresenter: ArticleListPresenterProtocol {
    
    private var articleList: [Article]?
    private let view: ArticleListViewProtocol
    private let getArticleListUseCase: GetArticleListUseCaseProtocol
    
    init(view: ArticleListViewProtocol, getArticleListUseCase: GetArticleListUseCaseProtocol) {
        self.view = view
        self.getArticleListUseCase = getArticleListUseCase
    }
    
    func loadArticles(source: String) {
        view.showLoading()
        
        getArticleListUseCase.getArticleList(source: source) { (articleList, error) in
            
            self.view.hideLoading()
            
            if let articleList = articleList {
                self.articleList = articleList
                self.view.reloadList(articleList: articleList)
            } else {
                self.view.showMessage(title: "Error", message: "Error", handler: { (action) in
                    self.view.popView()
                })
            }
        }
    }
}
