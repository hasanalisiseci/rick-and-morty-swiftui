//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

struct LocationModel<T:Codable>: Codable {
    let info: T?
    let results: [LocationResult]?
}
