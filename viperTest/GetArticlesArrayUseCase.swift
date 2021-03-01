//
//  GetArticlesArrayUseCase.swift
//  viperTest
//
//  Created by 三浦　知明 on 2021/03/01.
//  Copyright © 2021 三浦　知明. All rights reserved.
//

import Foundation

class GetArticlesArrayUseCase: UseCaseProtocol {
    
    func execute(_ parameter: Void, completion: ((Result<[ArticleEntity], Error>) -> ())?) {
        let res: [ArticleEntity] = [
            ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文"),
            ArticleEntity(id: 2, userId: 1, title: "タイトル2", body: "本文2"),
            ArticleEntity(id: 3, userId: 1, title: "タイトル3", body: "本文3"),
        ]
        completion?(.success(res))
    }
}
