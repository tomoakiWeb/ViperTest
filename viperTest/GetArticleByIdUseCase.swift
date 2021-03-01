//
//  GetArticleByIdUseCase.swift
//  viperTest
//
//  Created by 三浦　知明 on 2021/03/01.
//  Copyright © 2021 三浦　知明. All rights reserved.
//

import Foundation


class GetArticleByIdUseCase: UseCaseProtocol {
    
    func execute(_ parameter: Int, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let res = ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文")
        
        completion?(.success(res))
    }
}
