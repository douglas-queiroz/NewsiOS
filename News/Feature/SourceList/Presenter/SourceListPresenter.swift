//
//  SourceListPresenter.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import Foundation

class SourceListPresenter: SourceListPresenterProtocol {
    
    private let view: SourceListViewProtocol
    private let getSourceListUseCase: GetSourceListUseCaseProtocol
    private var sourceList: [Source]?
    
    init(view: SourceListViewProtocol, getSourceListUseCase: GetSourceListUseCaseProtocol) {
        self.getSourceListUseCase = getSourceListUseCase
        self.view = view
    }
    
    func loadSourceList() {
        view.showLoading()
        
        getSourceListUseCase.getSourceList { (sourceList, error) in
            
            self.view.hideLoading()
            
            if let sourceList = sourceList {
                self.sourceList = sourceList
                self.view.reloadList(source: sourceList)
            } else {
                self.view.showMessage(title: "Error", message: "Error msg", handler: nil)
            }
        }
    }
    
    func selectSource(index: Int) {
        if let source = sourceList?[index], let sourceId = source.id {
            view.callArticleListView(with: sourceId)
        }
    }
}
