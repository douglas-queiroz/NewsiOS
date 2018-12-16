//
//  GetSourceListUseCaseMock.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation
@testable import News

class GetSourceListUseCaseMock: GetSourceListUseCaseProtocol {
    
    var sourceList: [Source]?
    var error: Error?
    
    func getSourceList(listener: @escaping GetSourceListCompletion) {
        listener(sourceList, error)
    }
}
