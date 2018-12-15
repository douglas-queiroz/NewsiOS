//
//  ArticleRequestProtocol.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol ArticleRequesterProtocol {
    
    typealias ReponseArticleListCompletion = ([Article]?, Error?) -> Void
    
    func getArticleList(response: ReponseArticleListCompletion)
}
