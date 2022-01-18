//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

class LocationViewModel: ObservableObject {
    let service = Service.shared
    
    @Published var locationResponse = [LocationResult]()
    
    func initialize() {
        fetchContent()
    }
    
    func fetchContent() {
        service.fetchRequest(apiType: Service.apiType.location) { [weak self] (response: Result<LocationModel, RickandMortyError>) in
              switch response {
              case .success(let model):
                  guard let results = model.results else { return }
                  self?.locationResponse = results
              case .failure(let error):
                  print(error.localizedDescription)
              }

        }
    }
    
}
