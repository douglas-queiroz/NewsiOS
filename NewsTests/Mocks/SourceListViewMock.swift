//
//  SourceListViewMock.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit
@testable import News

class SourceListViewMock: BaseViewMock, SourceListViewProtocol {
    
    var sourceLoaded: [Source]?
    var sourceId: String?
    
    func reloadList(sourceList: [Source]) {
        self.sourceLoaded = sourceList
    }
    
    func callArticleListView(with sourceId: String) {
        self.sourceId = sourceId
    }
}
