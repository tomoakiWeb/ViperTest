//
//  ArticleListViewController.swift
//  viperTest
//
//  Created by 三浦　知明 on 2020/09/11.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    var presenter: ArticleListPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articleEntities = [ArticleEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = articleEntities[indexPath.row].title
        return cell
    }
    
}

extension ArticleListViewController: ArticleListViewProtocol {
    
    func showArticles(_ articleEntities: [ArticleEntity]) {
        self.articleEntities = articleEntities
        tableView.reloadData()
    }
    
    func showEmpty() {
        tableView.isHidden = true
        showArticles([])
    }
    
    func showError(_ error: Error) {
        // 今回はスキップ
    }
}
