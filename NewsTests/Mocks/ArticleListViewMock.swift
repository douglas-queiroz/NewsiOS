//
//  ArticleListViewMock.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
@testable import News
class ArticleListViewMock: BaseViewMock, ArticleListViewProtocol {
 
    var articleList: [Article]?
    var popViewWasCalledQtTimes = 0
    
    func reloadList(articleList: [Article]) {
        self.articleList = articleList
    }
    
    func popView() {
        popViewWasCalledQtTimes += 1
    }
}
