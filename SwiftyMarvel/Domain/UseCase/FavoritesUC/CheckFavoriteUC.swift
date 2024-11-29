//
//  CheckFavoriteUC.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol CheckFavoriteUC {
    func execute(character: Character) -> Bool
}

class DefaultCheckFavoriteUC: CheckFavoriteUC {
    private let favoritesRepository: FavoritesRepository
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute(character: Character) -> Bool {
        favoritesRepository.isFavorite(character: character)
    }
}
