//
//  GetArticleUserCaseProtocol.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol GetArticlesUseCaseProtocol {
    
    typealias GetArticleListCompletion = ([Article]?, Error?) -> Void
    
    func getArticle(listener: GetArticleListCompletion)
}
