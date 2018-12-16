//
//  ArticleRequester.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class ArticleRequester: ArticleRequesterProtocol {
    
    func getArticleList(source: String, responseCompletion: @escaping ReponseArticleListCompletion) {
        
        request(NewsApi.getArticles(source: source))
            .debugLog()
            .responseObject { (response: DataResponse<ResponseArticles>) in
            
                switch response.result {
                case .success(let result):
                    responseCompletion(result.articles, nil)
                    return
                case .failure(let error):
                    responseCompletion(nil, error)
                }
        }
    }
}
