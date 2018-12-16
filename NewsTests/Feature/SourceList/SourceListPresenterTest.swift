//
//  SourceListPresentTest.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import XCTest
@testable import News

class SourceListPresenterTest: XCTestCase {

    private var getSourceListUseCase: GetSourceListUseCaseMock!
    private var view: SourceListViewMock!
    private var presenter: SourceListPresenter!
    
    override func setUp() {
        getSourceListUseCase = GetSourceListUseCaseMock()
        view = SourceListViewMock()
        presenter = SourceListPresenter(view: view, getSourceListUseCase: getSourceListUseCase)
    }

    func testLoadSourceList() {
        getSourceListUseCase.sourceList = [Source(), Source(), Source()]
        presenter.loadSourceList()
        
        XCTAssertEqual(view.showLoadingWasCalledQtTimes, 1)
        XCTAssertEqual(view.hideLoadingWasCalledQtTimes, 1)
        XCTAssertNotNil(view.sourceLoaded)
        XCTAssertEqual(view.sourceLoaded?.count, getSourceListUseCase.sourceList?.count)
        XCTAssertNil(view.titleAlert)
        XCTAssertNil(view.messageAlert)
        XCTAssertNil(view.handler)
        XCTAssertNil(view.sourceId)
    }
    
    func testLoadSourceList_withError() {
        getSourceListUseCase.error = ErrorNetwork()
        presenter.loadSourceList()
        
        XCTAssertEqual(view.showLoadingWasCalledQtTimes, 1)
        XCTAssertEqual(view.hideLoadingWasCalledQtTimes, 1)
        XCTAssertNil(view.sourceLoaded)
        XCTAssertEqual(view.sourceLoaded?.count, getSourceListUseCase.sourceList?.count)
        XCTAssertNotNil(view.titleAlert)
        XCTAssertNotNil(view.messageAlert)
        XCTAssertNil(view.handler)
        XCTAssertNil(view.sourceId)
    }
    
    func testCallArticleListView() {
        let sourceSelected = Source()
        sourceSelected.id = "source_id"
        getSourceListUseCase.sourceList = [sourceSelected, Source(), Source(), Source()]
        presenter.loadSourceList()
        presenter.selectSource(index: 0)
        
        XCTAssertEqual(view.showLoadingWasCalledQtTimes, 1)
        XCTAssertEqual(view.hideLoadingWasCalledQtTimes, 1)
        XCTAssertNotNil(view.sourceLoaded)
        XCTAssertEqual(view.sourceLoaded?.count, getSourceListUseCase.sourceList?.count)
        XCTAssertNil(view.titleAlert)
        XCTAssertNil(view.messageAlert)
        XCTAssertNil(view.handler)
        XCTAssertNotNil(view.sourceId)
    }
}
