//
//  GetCharactersUC.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

struct GetCharactersParams {
    let offset: Int
    let searchKey: String?
}

protocol GetCharactersUC {
    func execute(with params: GetCharactersParams) async -> Result<PaginatedResponse<Character>, AppError>
}

class DefaultGetCharactersUC: GetCharactersUC {
    private var repository: CharactersRepository
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    func execute(with params: GetCharactersParams) async -> Result<PaginatedResponse<Character>, AppError> {
        return await repository.getCharacters(from: params.offset, by: params.searchKey)
    }
}
