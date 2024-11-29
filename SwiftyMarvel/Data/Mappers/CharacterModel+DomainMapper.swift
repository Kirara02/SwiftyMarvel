//
//  CharacterModel+DomainMapper.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

extension CharacterModel: DomainMapper {
    func toDomain() -> Character {
        return Character(
            id: id,
            name: name,
            description: characterDescription,
            modified: modified,
            thumbnailURL: thumbnail?.url)
    }
}
