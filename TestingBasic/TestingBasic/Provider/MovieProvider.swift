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

class MovieProviderImplementation: MovieProvider {
    
    var provider: ProviderProtocol = Provider()
    
    func getMovie(success: @escaping(MovieEntity) -> Void, failure: @escaping(EError) -> Void) {
        provider.request(entityClass: MovieEntity.self, endpoint: "http://demo8628160.mockable.io/movie", method: .get, success: { (entity) in
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
    
    func getMovies(success: @escaping([MovieEntity]) -> Void, failure: @escaping(EError) -> Void) {
        provider.request(entityClass: [MovieEntity].self, endpoint: "http://demo8628160.mockable.io/movies", method: .get) { (movies) in
            success(movies)
        } failure: { (error) in
            failure(error)
        }
    }
}
