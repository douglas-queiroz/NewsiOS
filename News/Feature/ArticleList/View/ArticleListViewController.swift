//
//  ArticleListViewController.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit

class ArticleListViewController: BaseViewController {

    var sourceId: String!
    
    private let ARTICLE_CELL_IDENTIFIER = "article_cell_identifier"
    private var articleList: [Article]?
    private var presenter: ArticleListPresenterProtocol!
    
    @IBOutlet weak var articleListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        registerCell()
        
        if let sourceId = sourceId {
            presenter.loadArticles(source: sourceId)
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func initPresenter() {
        let articleRequester = ArticleRequester()
        let getArticleListUseCase = GetArticleListUseCase(articleRequester: articleRequester)
        presenter = ArticleListPresenter(view: self, getArticleListUseCase: getArticleListUseCase)
    }
}

extension ArticleListViewController: UITableViewDataSource, UITabBarDelegate {
    
    private func registerCell() {
        let nib = UINib(nibName: ArticleTableViewCell.NAME, bundle: nil)
        self.articleListTableView.register(nib, forCellReuseIdentifier: ARTICLE_CELL_IDENTIFIER)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articleListCount = self.articleList?.count {
            return articleListCount
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ARTICLE_CELL_IDENTIFIER) as! ArticleTableViewCell
        if let article = self.articleList?[indexPath.row] {
            cell.setup(article: article)
        }
        
        return cell
    }
}

extension ArticleListViewController: ArticleListViewProtocol {
    
    func reloadList(articleList: [Article]) {
        self.articleList = articleList
        self.articleListTableView.reloadData()
    }
    
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
