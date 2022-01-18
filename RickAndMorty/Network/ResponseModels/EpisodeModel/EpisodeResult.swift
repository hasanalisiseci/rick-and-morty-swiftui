//
//  EpisodeResult.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import Foundation

struct EpisodeResult: Codable, Identifiable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name, airDate = "air_date", episode, characters, url, created
    }
}
