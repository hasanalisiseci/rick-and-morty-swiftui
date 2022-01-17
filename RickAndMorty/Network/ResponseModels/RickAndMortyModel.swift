//
//  RickAndMortyModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import Foundation

struct RickandMortyModel: Codable {
    let info: CharacterInfo
    let results: [Character]?
}

// MARK: - Info
struct CharacterInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: Species?
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    case poopybutthole = "Poopybutthole"
    case mythologicalCreature = "Mythological Creature"
    case unknown = "unknown"
    case humanoid = "Humanoid"
    case cronenberg = "Cronenberg"
    case animal = "Animal"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


extension Character {
    
    static func fakeCharacterData() -> Character {
        Character(id: 2,
               name: "Morty Smith",
               status: Status.alive,
               species: Species.human,
               type: "",
               gender: Gender.female,
               origin: Location(name: "unknown", url: ""),
               location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
               image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
               episode: [
               "https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"],
               url: "https://rickandmortyapi.com/api/character/2",
               created: "2017-11-04T18:50:21.651Z")
    }
}
