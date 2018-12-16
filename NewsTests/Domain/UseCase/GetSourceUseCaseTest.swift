//
//  GetSourceUseCaseTest.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import XCTest
@testable import News

class GetSourceUseCaseTest: XCTestCase {

    private var requesterMock: SourceRequesterMock!
    private var getSourceListUseCase: GetSourceListUseCaseProtocol!
    
    override func setUp() {
        requesterMock = SourceRequesterMock()
        self.getSourceListUseCase = GetSourceListUseCase(sourceRequester: requesterMock)
    }

    func testGetSource() {
        
        requesterMock.sourceList = [Source(), Source(), Source()]
        
        getSourceListUseCase.getSourceList { (sourceList, error) in
            
            XCTAssertNotNil(sourceList)
            XCTAssertEqual(sourceList?.count, self.requesterMock.sourceList?.count)
            XCTAssertNil(error)
        }
    }
    
    func testGetSource_withError() {
        
        requesterMock.error = ErrorNetwork()
        
        getSourceListUseCase.getSourceList { (sourceList, error) in
            
            XCTAssertNotNil(error)
            XCTAssertNil(sourceList)
        }
    }
}
