//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Status
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Species
enum Species: String, Codable {
    case alien = "Alien"
    case animal = "Animal"
    case cronenberg = "Cronenberg"
    case disease = "Disease"
    case human = "Human"
    case humanoid = "Humanoid"
    case mythologicalCreature = "Mythological Creature"
    case poopybutthole = "Poopybutthole"
    case robot = "Robot"
    case unknown = "unknown"
}

// MARK: - Gender
enum Gender: String, Codable {
    case female = "Female"
    case genderless = "Genderless"
    case male = "Male"
    case unknown = "unknown"
}
