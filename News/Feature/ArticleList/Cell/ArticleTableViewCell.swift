//
//  ArticleTableViewCell.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    static let NAME = "ArticleTableViewCell"
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publishDay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(article: Article) {
        titleLable.text = article.title
        descriptionLabel.text = article.description
        thumbnailImageView.loadImagem(from: article.thumbnail)
        authorLabel.text = article.author
        publishDay.text = article.publishDay
    }
}
