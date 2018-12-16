//
//  ArticleListPresenterTest.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import XCTest
@testable import News

class ArticleListPresenterTest: XCTestCase {

    private var getArticleListUseCase: GetArticleListUseCaseMock!
    private var view: ArticleListViewMock!
    private var presenter: ArticleListPresenter!
    
    override func setUp() {
        getArticleListUseCase = GetArticleListUseCaseMock()
        view = ArticleListViewMock()
        presenter = ArticleListPresenter(view: view, getArticleListUseCase: getArticleListUseCase)
    }

    func testLoadArticles() {
        let sourceId = "source_id"
        getArticleListUseCase.articleList = [Article(), Article(), Article()]
        
        presenter.loadArticles(source: sourceId)
        
        XCTAssertEqual(view.showLoadingWasCalledQtTimes, 1)
        XCTAssertEqual(view.hideLoadingWasCalledQtTimes, 1)
        XCTAssertNotNil(view.articleList)
        XCTAssertEqual(view.articleList?.count, getArticleListUseCase.articleList?.count)
        XCTAssertNil(view.titleAlert)
        XCTAssertNil(view.messageAlert)
        XCTAssertNil(view.handler)
    }
    
    func testLoadArticles_withError() {
        let sourceId = "source_id"
        getArticleListUseCase.error = ErrorNetwork()
        
        presenter.loadArticles(source: sourceId)
        
        XCTAssertEqual(view.showLoadingWasCalledQtTimes, 1)
        XCTAssertEqual(view.hideLoadingWasCalledQtTimes, 1)
        XCTAssertNil(view.articleList)
        XCTAssertNotNil(view.titleAlert)
        XCTAssertNotNil(view.messageAlert)
        XCTAssertNotNil(view.handler)
    }

}
