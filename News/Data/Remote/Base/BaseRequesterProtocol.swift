//
//  BaseRequesterProtocol.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol BaseRequesterProtocol {
    
    associatedtype ObjectType
    
    typealias ResponseObject = (ObjectType, Error)
    typealias ResponseListObject = ([ObjectType], Error)
}
