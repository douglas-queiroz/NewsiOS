//
//  SourceRequester.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SourceRequester: SourceRequesterProtocol {
    
    func getSourceList(responseCompletion: @escaping ReponseSourceListCompletion) {
        
        request(NewsApi.getSources)
            .debugLog()
            .responseObject { (response:DataResponse<ResponseSources>) in
            
            switch response.result {
            case .success(let response):
                
                responseCompletion(response.sources, nil)
                break
            case .failure(let error):
                
                responseCompletion(nil, error)
                break
            }
        }
    }
}
