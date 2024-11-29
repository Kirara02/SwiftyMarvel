//
//  ComicsRepository.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol ComicsRepository {
    func getComics(by characterId: Int, from offset: Int) async -> Result<PaginatedResponse<Comic>, AppError>
}
