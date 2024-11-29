//
//  GetComicsUC.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

struct GetComicsParams {
    let offset: Int
    let characterID: Int
}

protocol GetComicsUC {
    func execute(with params: GetComicsParams) async -> Result<PaginatedResponse<Comic>, AppError>
}

class DefaultGetComicsUC: GetComicsUC {
    private let repository: ComicsRepository
    
    init(repository: ComicsRepository) {
        self.repository = repository
    }
    
    func execute(with params: GetComicsParams) async -> Result<PaginatedResponse<Comic>, AppError> {
        return await repository.getComics(by: params.characterID, from: params.offset)
    }
}
