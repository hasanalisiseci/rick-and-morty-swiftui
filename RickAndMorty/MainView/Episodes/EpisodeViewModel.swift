//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

class EpisodeViewModel: ObservableObject {
    let service = Service.shared
    
    @Published var episodeResponse = [EpisodeResult]()
    
    func initialize() {
        fetchContent()
    }
    
    func fetchContent() {
        service.fetchRequest(apiType: Service.apiType.episode) { [weak self] (response: Result<EpisodesModel, RickandMortyError>) in
              switch response {
              case .success(let model):
                  guard let results = model.results else { return }
                  self?.episodeResponse = results
              case .failure(let error):
                  print(error.localizedDescription)
              }

        }
    }
    
}
