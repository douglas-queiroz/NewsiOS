//
//  GetSourceUserCase.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol GetSourceListUseCaseProtocol {
    
    typealias GetSourceListCompletion = ([Source]?, Error?) -> Void
    
    func getSourceList(listener: @escaping GetSourceListCompletion)
}
