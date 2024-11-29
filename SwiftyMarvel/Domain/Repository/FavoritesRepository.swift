//
//  FavoritesRepository.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol FavoritesRepository {
    /// Get all favorites characters from local storage
    func getFavorites() -> Result<[Character], AppError>
    
    /// Check if character is favorite or not
    func isFavorite(character: Character) -> Bool
    
    /// Add character to favorites
    func addFavorite(character: Character)
    
    /// Remove character from favorites
    func removeFavorite(character: Character)
}
