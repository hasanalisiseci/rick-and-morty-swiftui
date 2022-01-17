//
//  RickAndMortyError.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import Foundation

enum RickandMortyError: Error {
    
    case decodingError
    case dataError
    case urlError
    case responseError
    
    var localizedDescription: String {
        
        switch self {
        case .decodingError:
            return "Decode edilemedi"
        case .dataError:
            return "Data error"
        case .urlError:
            return "URL error"
        case .responseError:
            return "Response error"
        }
    }
}
