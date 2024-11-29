//
//  DomainMapper.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

protocol DomainMapper {
    associatedtype EntityType
    func toDomain() -> EntityType
}
