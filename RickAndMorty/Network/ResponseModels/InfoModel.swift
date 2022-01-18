//
//  InfoModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import Foundation

// MARK: - Info
struct InfoModel: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
