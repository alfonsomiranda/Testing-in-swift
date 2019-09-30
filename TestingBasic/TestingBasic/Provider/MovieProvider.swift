//
//  MovieProvider.swift
//  TestingBasic
//
//  Created by Alfonso Miranda Castro on 30/09/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import Foundation

protocol MovieProvider {
    func getMovie(success: @escaping(MovieEntity) -> Void, failure: @escaping(EError) -> Void)
}

class MovieProviderImplementation: BaseProvider, MovieProvider {
    func getMovie(success: @escaping(MovieEntity) -> Void, failure: @escaping(EError) -> Void) {
        request(entityClass: MovieEntity.self, endpoint: "https://api.myjson.com/bins/f2s0d", method: .get, success: { (entity) in
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
}
