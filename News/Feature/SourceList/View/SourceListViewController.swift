//
//  SourceListViewController.swift
//  News
//
//  Created by Douglas Queiroz on 15/12/18.
//  Copyright © 2018 Douglas Queiroz. All rights reserved.
//

import UIKit

class SourceListViewController: BaseViewController {
    
    private let SOURCE_CELL_IDENTIFIER = "source_cell_identifier"
    
    @IBOutlet weak var sourceListTableView: UITableView!
    
    private var sourceList: [Source]?
    private var presenter: SourceListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registeSourceTableViewCell()
        self.initPresenter()
        self.presenter.loadSourceList()
    }
    
    private func initPresenter() {
        let sourceRequester = SourceRequester()
        let getSourceListRequester = GetSourceListUseCase(sourceRequester: sourceRequester)
        presenter = SourceListPresenter(view: self, getSourceListUseCase: getSourceListRequester)
    }
}

extension SourceListViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func registeSourceTableViewCell() {
        let nib = UINib(nibName: SourceTableViewCell.NAME, bundle: nil)
        self.sourceListTableView.register(nib, forCellReuseIdentifier: SOURCE_CELL_IDENTIFIER)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sourceList = sourceList {
            return sourceList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SOURCE_CELL_IDENTIFIER) as! SourceTableViewCell
        
        if let source = self.sourceList?[indexPath.row] {
            cell.setup(source: source)
        }
        
        return cell
    }
}

extension SourceListViewController: SourceListViewProtocol {
    
    func reloadList(source: [Source]) {
        self.sourceList = source
        self.sourceListTableView.reloadData()
    }
}
