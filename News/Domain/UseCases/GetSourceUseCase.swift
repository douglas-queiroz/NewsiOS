//
//  GetSourceUseCase.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class GetSourceUseCase: GetSourceUseCaseProtocol {
    
    private let sourceRequester: SourceRequesterProtocol
    
    init(sourceRequester: SourceRequesterProtocol) {
        self.sourceRequester = sourceRequester
    }
    
    func getSource(listener: GetSourceListCompletion) {
        
        sourceRequester.getSourceList(response: listener)
    }
}
