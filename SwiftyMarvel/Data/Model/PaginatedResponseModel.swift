//
//  PaginatedResponseModel.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

struct PaginatedResponseModel<T>: Codable  where T: Codable, T: DomainMapper {
    let offset, limit, total, count: Int?
    let results: [T]?
}
