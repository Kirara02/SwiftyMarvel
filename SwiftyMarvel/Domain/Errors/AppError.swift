//
//  AppError.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

enum AppError: Error, Equatable {
    case networkError(String)
    case parsingError(String)
    case serverError(String)
    case unknownError(String)
    case localDataFetchError(String)
}
