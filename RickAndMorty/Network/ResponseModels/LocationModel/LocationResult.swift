//
//  LocationResult.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import Foundation

struct LocationResult: Codable, Identifiable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
