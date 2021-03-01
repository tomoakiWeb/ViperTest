//
//  Router.swift
//  viperTest
//
//  Created by 三浦　知明 on 2021/03/01.
//  Copyright © 2021 三浦　知明. All rights reserved.
//

import UIKit

protocol ArticleListRouterProtocol: AnyObject {
    
    func showArticleDetail(articleEntity: ArticleEntity)
}

class ArticleListRouter: ArticleListRouterProtocol {
    
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func showArticleDetail(articleEntity: ArticleEntity) {
        print("詳細画面へ遷移する 記事ID: \(articleEntity.id)")
    }
}
