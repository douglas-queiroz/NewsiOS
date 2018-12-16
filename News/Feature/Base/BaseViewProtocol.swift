//
//  BaseViewPresenter.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit

protocol BaseViewProtocol {
    
    func showLoading()
    
    func hideLoading()
    
    func showMessage(title: String?, message: String, handler: ((UIAlertAction) -> Void)?)
}
