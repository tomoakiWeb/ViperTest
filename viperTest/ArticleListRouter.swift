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
        guard let articleDetailViewController = UIStoryboard(name: "ArticleDetail", bundle: nil).instantiateInitialViewController() as? ArticleDetailViewController else {
            fatalError()
        }
        
        articleDetailViewController.articleEntity = articleEntity
        
        articleDetailViewController.presenter = ArticleDetailPresenter(
            view: articleDetailViewController,
            inject: ArticleDetailPresenter.Dependency(
                getArticleByIdUseCase: UseCase(GetArticleByIdUseCase())
            )
        )
        
        view.navigationController?.pushViewController(articleDetailViewController,
                                                      animated: true)
    }
}
