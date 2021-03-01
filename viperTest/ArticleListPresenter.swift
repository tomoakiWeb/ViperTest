//
//  ArticleListPresenter.swift
//  viperTest
//
//  Created by 三浦　知明 on 2021/03/01.
//  Copyright © 2021 三浦　知明. All rights reserved.
//

import Foundation

protocol ArticleListPresenterProtocol: AnyObject {
    func didLoad()
    func didSelect(articleEntity: ArticleEntity)
}

protocol ArticleListViewProtocol: AnyObject {
    func showArticles(_ articleEntities: [ArticleEntity])
    func showEmpty()
    func showError(_ error: Error)
}

class ArticleListPresenter {
    
    weak var view: ArticleListViewProtocol!
    
    init(view: ArticleListViewProtocol) {
        self.view = view
    }
}

extension ArticleListPresenter: ArticleListPresenterProtocol {
        
    func didLoad() {
        GetArticlesArrayUseCase().execute(()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articleEntities):
                if articleEntities.isEmpty {
                    self.view.showEmpty()
                    return
                }
                self.view.showArticles(articleEntities)
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
    
    func didSelect(articleEntity: ArticleEntity) {
    
    }
}
