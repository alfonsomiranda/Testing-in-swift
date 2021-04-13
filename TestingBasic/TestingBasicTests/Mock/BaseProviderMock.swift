//
//  BaseProviderMock.swift
//  TestingBasicTests
//
//  Created by Alfonso Miranda Castro on 12/4/21.
//  Copyright © 2021 alfonsomiranda. All rights reserved.
//

import Foundation
@testable import TestingBasic

class ProviderMock: ProviderProtocol {
    var isRequestCalled = false
    var isSuccess = true
    
    func request<T>(entityClass: T.Type, endpoint: String, method: HTTPMethod, success: @escaping (T) -> Void, failure: @escaping (EError) -> Void) where T : Decodable {
        self.isRequestCalled = true
        
        if isSuccess {
            success([MovieEntity(title: "Terminator", year: "1985", movieEntityDescription: "", director: ""), MovieEntity(title: "Terminator", year: "1985", movieEntityDescription: "", director: ""), MovieEntity(title: "Terminator", year: "1985", movieEntityDescription: "", director: ""), MovieEntity(title: "Terminator", year: "1985", movieEntityDescription: "", director: "")] as! T)
        }
    }
}
