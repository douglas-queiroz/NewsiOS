//
//  SourceTableViewCell.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit

class SourceTableViewCell: UITableViewCell {
    
    static let NAME = "SourceTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(source: Source) {
        
        self.titleLabel.text = source.title
        self.descriptionLabel.text = source.description
        self.urlLabel.text = source.url
    }
    
}
