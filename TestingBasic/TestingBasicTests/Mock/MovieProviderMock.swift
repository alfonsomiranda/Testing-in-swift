//
//  MovieProviderMock.swift
//  TestingBasicTests
//
//  Created by Alfonso Miranda Castro on 30/09/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import Foundation
@testable import TestingBasic

class MovieProviderMock: MovieProvider {
    var isGetMovieCalled = false
    var successState = false
    
    func getMovie(success: @escaping (MovieEntity) -> Void, failure: @escaping (EError) -> Void) {
        self.isGetMovieCalled = true
        
        if successState {
            let entity = MovieEntity(title: "Terminator 2", year: "1992", movieEntityDescription: "Un robot malo intentando matar a un niño", director: "Steven Spilberg", cast: "Cuache", rate: 10)
            success(entity)
        }
    }
}
