//
//  LocationDetailViewModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import Foundation

class LocationDetailViewModel: ObservableObject {
    let service = Service.shared
    @Published var chars = [Character]()

    func initialize(location: LocationResult) {
        getCharactersInThisEpisode(location: location)
    }

    func getCharactersInThisEpisode(location: LocationResult) {
        for char in location.residents! {
            service.fetchOnlyCharRequest(url: char) { [weak self] response in
                switch response {
                case .success(let model):
                    self?.chars.append(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

}
