//
//  EpisodesModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

// MARK: - Episodes
struct EpisodesModel: Codable {
    let info: EpisodeInfo?
    let results: [EpisodeResult]?
}

// MARK: - Info
struct EpisodeInfo: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct EpisodeResult: Codable, Identifiable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
    
    enum CodingKeys : String, CodingKey {
            case id, name, airDate = "air_date", episode, characters, url, created
        }
}
