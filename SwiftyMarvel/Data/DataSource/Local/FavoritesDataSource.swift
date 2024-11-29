//
//  FavoriteDataSource.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation
import CoreData

protocol FavoritesDataSource {
    func getFavorites() throws -> [Character]
    func isFavorite(character: Character) throws -> Bool
    func addFavorite(character: Character) throws
    func removeFavorite(character: Character) throws
}

class DefaultFavoritesDataSource: FavoritesDataSource {
    private let dataStack: CoreDataStack
    
    private var managedObjectContext: NSManagedObjectContext {
        dataStack.mainContext
    }
    
    init(dataStack: CoreDataStack) {
        self.dataStack = dataStack
    }
        
    func getFavorites() throws -> [Character] {
        let fetchRequest = CharacterEntity.fetchRequest()
        let result = try managedObjectContext.fetch(fetchRequest)
        return result.map({$0.toDomain()})
    }
    
    func addFavorite(character: Character) throws {
        let _ = character.toCoreDataEntity(in: managedObjectContext)
        dataStack.saveContext()
    }
    
    func removeFavorite(character: Character) throws {
        let fetchRequest = CharacterEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", character.id ?? 0)
        let result = try managedObjectContext.fetch(fetchRequest)
        result.forEach({managedObjectContext.delete($0)})
        
        dataStack.saveContext()
    }
    
    func isFavorite(character: Character) throws -> Bool {
        let fetchRequest = CharacterEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %d", character.id ?? 0)
        let result = try managedObjectContext.fetch(fetchRequest)
        
        return !result.isEmpty
    }
}

