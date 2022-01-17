//
//  CharViewModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

class CharViewModel: ObservableObject {
    
    enum ViewStatus {
        case all
        case alive
        case dead
        case unknown
    }
    
    let service = Service.shared

    @Published var rickAndMortyResponse = [Character]()

    func initialize(filter: String) {
        fetchContent(filter: filter)
    }

    func fetchContent(filter: String) {
        service.fetchCharRequest(filter: filter,apiType: Service.apiType.character) {  [weak self] response in
            switch response {
            case .success(let model):
                guard let results = model.results else { return }
                self?.rickAndMortyResponse = results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
