//
//  ComicModel.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

// MARK: - ComicModel -

struct ComicModel: Codable {
    let id: Int?
    let title, description: String?
    let modified: String?
    let isbn, upc, diamondCode, ean: String?
    let issn, format: String?
    let thumbnail: ThumbnailModel?
}
