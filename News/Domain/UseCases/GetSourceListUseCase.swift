//
//  GetSourceUseCase.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class GetSourceListUseCase: GetSourceListUseCaseProtocol {
    
    private let sourceRequester: SourceRequesterProtocol
    
    init(sourceRequester: SourceRequesterProtocol) {
        self.sourceRequester = sourceRequester
    }
    
    func getSource(listener: @escaping GetSourceListCompletion) {
        
        sourceRequester.getSourceList(responseCompletion: listener)
    }
}
