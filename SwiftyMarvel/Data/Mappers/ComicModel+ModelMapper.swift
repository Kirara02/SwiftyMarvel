//
//  ComicEntity.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

extension ComicModel: DomainMapper {
    func toDomain() -> Comic {
        return Comic(
            id: id,
            title: title,
            description: description,
            modified: modified,
            isbn: isbn,
            upc: upc,
            diamondCode: diamondCode,
            ean: ean,
            issn: issn,
            format: format,
            thumbnailURL: thumbnail?.url)
    }
}
