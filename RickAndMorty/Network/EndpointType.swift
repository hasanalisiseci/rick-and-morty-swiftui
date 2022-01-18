//
//  EndpointType.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import Foundation

enum endpointType {
    case character
    case episode
    case location

    var apiTypeString: String {
        switch self {
        case .character:
            return "character"
        case .episode:
            return "episode"
        case .location:
            return "location"
        }
    }
}
