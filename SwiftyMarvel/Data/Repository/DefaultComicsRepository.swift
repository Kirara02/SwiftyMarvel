//
//  DefaultComicsRepository.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

class DefaultComicsRepository: ComicsRepository {
    private let comicsDataSource: ComicsDataSource
    
    init(comicsDataSource: ComicsDataSource) {
        self.comicsDataSource = comicsDataSource
    }
    
    func getComics(by characterId: Int, from offset: Int) async -> Result<PaginatedResponse<Comic>, AppError> {
        do {
            let data = try await comicsDataSource.getComics(by: characterId, from: offset)
            let comics = data.toDomain(dataType: Comic.self)
            
            return .success(comics)
        } catch {
            print(error.self)
            return .failure(error.toAppError)
        }
    }
}
