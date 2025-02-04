//
//  ComicsRequest.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

enum ComicsRequest: RequestProtocol {
    
    case getComicsByCharacterId(characterId: Int, offset: Int)
    
    // MARK: - Path -
    
    var path: String {
        switch self {
        case .getComicsByCharacterId(let characterId, _):
            return "/v1/public/characters/\(characterId)/comics"
        }
    }
    
    // MARK: - URL Params -

    var urlParams: [String: String?] {
        switch self {
        case .getComicsByCharacterId(_, let offset):
            return ["offset": "\(offset)",
                    "limit": "\(APIConstants.defaultLimit)"]
        }
    }
    var requestType: RequestType {
        .GET
    }
}
