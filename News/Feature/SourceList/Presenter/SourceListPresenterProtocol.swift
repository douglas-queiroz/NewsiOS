//
//  SourceListPresenterProtocol.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol SourceListPresenterProtocol {
    
    func loadSourceList()
    
    func selectSource(index: Int)
}
