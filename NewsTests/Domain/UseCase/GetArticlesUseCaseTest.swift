//
//  GetArticlesUseCaseTest.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import XCTest
@testable import News

class GetArticlesUseCaseTest: XCTestCase {
    
    private var requesterMock: ArticleRequesterMock!
    private var getArticleListUseCase: GetArticleListUseCaseProtocol!
    
    override func setUp() {
        requesterMock = ArticleRequesterMock()
        getArticleListUseCase = GetArticleListUseCase(articleRequester: requesterMock)
    }
    
    func testGetSource() {
        let source = "source"
        requesterMock.articleList = [Article(), Article(), Article()]
        
        getArticleListUseCase.getArticleList(source: source, listener: { (articleList, error) in
            
            XCTAssertNotNil(articleList)
            XCTAssertEqual(articleList?.count, self.requesterMock.articleList?.count)
            XCTAssertNil(error)
            XCTAssertEqual(source, self.requesterMock.source)
        })
    }
    
    func testGetSource_withError() {
        let source = "source"
        requesterMock.error = ErrorNetwork()
        
        getArticleListUseCase.getArticleList(source: source, listener: { (articleList, error) in
            
            XCTAssertNotNil(error)
            XCTAssertNil(articleList)
            XCTAssertEqual(source, self.requesterMock.source)
        })
    }
    
    
}
