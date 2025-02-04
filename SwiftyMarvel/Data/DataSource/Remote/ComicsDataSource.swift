//
//  ComicsDataSource.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

typealias ComicsResponse = BaseResponseModel<PaginatedResponseModel<ComicModel>>

// MARK: - Protocol -

protocol ComicsDataSource {
    
    func getComics(by characterId: Int, from offset: Int) async throws -> PaginatedResponseModel<ComicModel>
}

// MARK: - Implementation -

class DefaultComicsDataSource: ComicsDataSource {
    
    private let requestManager: RequestManager
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getComics(by characterId: Int, from offset: Int) async throws -> PaginatedResponseModel<ComicModel> {
        let request = ComicsRequest.getComicsByCharacterId(characterId: characterId, offset: offset)
        let response: ComicsResponse = try await requestManager.makeRequest(with: request)
        return response.data
    }
}
