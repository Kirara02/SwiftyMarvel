//
//  GetFavoritesUC.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol GetFavoritesUC {
    func execute() -> Result<[Character], AppError>
}

class DefaultGetFavoritesUC: GetFavoritesUC {
    private let favoritesRepository: FavoritesRepository
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute() -> Result<[Character], AppError> {
        favoritesRepository.getFavorites()
    }
}
