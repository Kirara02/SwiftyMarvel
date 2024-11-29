//
//  Error+AppError.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

extension Error {
    /// Converts any error to an `AppError` object.
    var toAppError: AppError {
        if self is NetworkError {
            return .networkError("errorWhileFetchingData")
        }
        return AppError.unknownError("unknownError")
    }
}
