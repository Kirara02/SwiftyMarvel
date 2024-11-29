//
//  CharactersRepository.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol CharactersRepository {
    func getCharacters(from offset: Int, by searchKey: String?) async ->
        Result<PaginatedResponse<Character>, AppError>
}
