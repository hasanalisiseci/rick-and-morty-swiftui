//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

// MARK: - Location
struct LocationModel: Codable {
    let info: LocationInfo?
    let results: [LocationResult]?
}

// MARK: - Info
struct LocationInfo: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct LocationResult: Codable, Identifiable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
