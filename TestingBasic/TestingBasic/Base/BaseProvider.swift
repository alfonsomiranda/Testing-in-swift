//
//  BaseProvider.swift
//  TestingBasic
//
//  Created by Alfonso Miranda Castro on 29/09/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import Foundation


class BaseProvider {
    func request<T: Decodable>(entityClass: T.Type, endpoint: String, method: HTTPMethod, success: @escaping(_ entity: T) -> Void, failure: @escaping(EError) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let url = URL(string: endpoint)!
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            guard error == nil else {
                failure(EError(domain: endpoint, code: 0, localizedDescription: error?.localizedDescription ?? ""))
                return
            }
            guard let responseData = data else {
                failure(EError(domain: "", code: -1, localizedDescription: ""))
                return
            }
            do {
                let response = try! JSONDecoder().decode(MovieEntity.self, from: responseData)
                success(response as! T)
            }
        })
        task.resume()
    }
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

struct EError {
    var domain: String? = ""
    var code: Int? = 0
    var _localizedDescription: String = ""
    
    init(domain: String, code: Int, localizedDescription: String) {
        self.domain = domain
        self.code = code
        _localizedDescription = localizedDescription
    }
}
