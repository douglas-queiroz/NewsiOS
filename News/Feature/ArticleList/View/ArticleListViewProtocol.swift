//
//  ArticleListViewProtocol.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

protocol ArticleListViewProtocol: BaseViewProtocol {
    
    func reloadList(articleList: [Article])
    
    func popView()
}
