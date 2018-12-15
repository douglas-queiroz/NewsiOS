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
    private var getArticlesUseCase: GetArticlesUseCaseProtocol!
    
    override func setUp() {
        requesterMock = ArticleRequesterMock()
        getArticlesUseCase = GetArticlesUseCase(articleRequester: requesterMock)
    }
    
    func testGetSource() {
        
        requesterMock.articleList = [Article(), Article(), Article()]
        
        getArticlesUseCase.getArticle { (articleList, error) in
            
            XCTAssertNotNil(articleList)
            XCTAssertEqual(articleList?.count, requesterMock.articleList?.count)
            XCTAssertNil(error)
        }
    }
    
    func testGetSource_withError() {
        
        requesterMock.error = ErrorNetwork()
        
        getArticlesUseCase.getArticle { (articleList, error) in
            
            XCTAssertNotNil(error)
            XCTAssertNil(articleList)
        }
    }
    
    
}
