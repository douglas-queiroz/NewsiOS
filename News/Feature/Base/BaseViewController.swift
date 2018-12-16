//
//  BaseTableViewController.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit
import PKHUD

class BaseViewController: UIViewController, BaseViewProtocol {

    func showLoading() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideLoading() {
        HUD.hide(animated: true)
    }
    
    func showMessage(title: String?, message: String, handler: ((UIAlertAction) -> Void)?) {
        let actionOk = UIAlertAction(title: "OK", style: .default, handler: handler)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(actionOk)
        
        present(alert, animated: true, completion: nil)
    }
}
