//
//  BaseResponse.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

struct BaseResponse<T> {
    let code: Int
    let status: String
    let data: T
}
