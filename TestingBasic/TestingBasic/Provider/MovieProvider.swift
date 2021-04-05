//
//  MovieProvider.swift
//  TestingBasic
//
//  Created by Alfonso Miranda Castro on 30/09/2019.
//  Copyright © 2019 alfonsomiranda. All rights reserved.
//

import Foundation

protocol MovieProvider {
    func getMovie(success: @escaping(MovieEntity) -> Void, failure: @escaping(EError) -> Void)
}

class MovieProviderImplementation: BaseProvider, MovieProvider {
    func getMovie(success: @escaping(MovieEntity) -> Void, failure: @escaping(EError) -> Void) {
        request(entityClass: MovieEntity.self, endpoint: "http://demo8628160.mockable.io/movies", method: .get, success: { (entity) in
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
}
