//
//  RickAndMortyModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import Foundation

struct CharacterModel<T:Codable>: Codable {
    let info: T?
    let results: [Character]?
}

