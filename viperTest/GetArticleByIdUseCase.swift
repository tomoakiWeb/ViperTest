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
        let session = URLSession(configuration: .default)
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(parameter)")!
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
                return
            }
            guard
                let data = data,
                let decoded = try? JSONDecoder().decode(ArticleEntity.self,
                                                        from: data)
                else {
                    let error = NSError(
                        domain: "parse-error",
                        code: 1,
                        userInfo: nil
                    )
                    DispatchQueue.main.async {
                        completion?(.failure(error))
                    }
                    return
            }
            
            DispatchQueue.main.async {
                completion?(.success(decoded))
            }
        }
        task.resume()
    }
}
