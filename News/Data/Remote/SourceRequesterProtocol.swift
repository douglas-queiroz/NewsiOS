//
//  SourceRequest.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol SourceRequesterProtocol {
    
    typealias ReponseSourceListCompletion = ([Source]?, Error?) -> Void
    
    func getSourceList(response: ReponseSourceListCompletion)
}
