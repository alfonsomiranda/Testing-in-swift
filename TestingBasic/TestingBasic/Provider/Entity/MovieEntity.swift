//
//  MovieEntity.swift
//  TestingBasic
//
//  Created by Alfonso Miranda Castro on 30/09/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import Foundation

// MARK: - MovieEntity
struct MovieEntity: Codable {
    let title, year, movieEntityDescription, director: String?
    let cast: String?
    let rate: Int?

    enum CodingKeys: String, CodingKey {
        case title, year
        case movieEntityDescription = "description"
        case director, cast, rate
    }
}
