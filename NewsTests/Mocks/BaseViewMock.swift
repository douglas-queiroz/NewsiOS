//
//  BaseViewMock.swift
//  NewsTests
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit
@testable import News

class BaseViewMock: BaseViewProtocol {
    
    var showLoadingWasCalledQtTimes = 0
    var hideLoadingWasCalledQtTimes = 0
    var titleAlert: String?
    var messageAlert: String?
    var handler: ((UIAlertAction) -> Void)?
    
    func showLoading() {
        self.showLoadingWasCalledQtTimes += 1
    }
    
    func hideLoading() {
        self.hideLoadingWasCalledQtTimes += 1
    }
    
    func showMessage(title: String?, message: String, handler: ((UIAlertAction) -> Void)?) {
        self.titleAlert = title
        self.messageAlert = message
        self.handler = handler
    }
}
