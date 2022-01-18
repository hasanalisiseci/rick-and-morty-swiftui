//
//  EpisodesModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

// MARK: - Episodes
struct EpisodesModel<T:Codable>: Codable {
    let info: T?
    let results: [EpisodeResult]?
}
