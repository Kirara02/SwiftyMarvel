//
//  ToggleFavoriteUC.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol ToggleFavoriteUC {
    func execute(character: Character)
}

class DefaultToggleFavoriteUC: ToggleFavoriteUC {
    private let favoritesRepository: FavoritesRepository
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute(character: Character) {
        if favoritesRepository.isFavorite(character: character) {
            favoritesRepository.removeFavorite(character: character)
        } else {
            favoritesRepository.addFavorite(character: character)
        }
    }
}
