//
//  MovieProviderTests.swift
//  TestingBasicTests
//
//  Created by Alfonso Miranda Castro on 12/4/21.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import XCTest
@testable import TestingBasic

class MovieProviderTests: XCTestCase {

    func test_movieProvider_get_movies_when_is_success() {
        //GIVEN
        let provider = MovieProviderImplementation()
        let providerMock = ProviderMock()
        providerMock.isSuccess = true
        provider.provider = providerMock

        let expect = self.expectation(description: #function)
        
        //WHEN
        provider.getMovies { (movies) in
            XCTAssertEqual(movies.count, 4)
            expect.fulfill()
        } failure: { (error) in
            
        }
        
        waitForExpectations(timeout: 1.0) { error in
            XCTAssertNil(error)
            XCTAssertTrue(providerMock.isRequestCalled)
        }
    }

}
