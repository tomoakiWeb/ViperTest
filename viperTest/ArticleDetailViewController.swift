//
//  ArticleDetailViewController.swift
//  viperTest
//
//  Created by 三浦　知明 on 2020/09/11.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum Row: String {
        case title
        case body
        
        static var rows: [Row] {
            return [.title, .body]
        }
    }
    
    var articleEntity: ArticleEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ArticleDetailViewController: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = Row.rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.rawValue, for: indexPath)
        
        if row == .title {
            cell.textLabel?.text = "タイトル"
            cell.detailTextLabel?.text = articleEntity.title
        }
        if row == .body {
            cell.textLabel?.text = articleEntity.body
            cell.detailTextLabel?.text = nil
        }
        return cell
    }
}
