//
//  UIImageExtension.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImagem(from url: String?) {
        guard let strUrl = url else { return }
        let url = URL(string: strUrl)
        self.sd_setImage(with: url, completed: nil)
    }
}
