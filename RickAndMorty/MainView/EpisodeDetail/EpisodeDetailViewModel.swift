//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import Foundation

class EpisodeDetailViewModel: ObservableObject {
    let service = Service.shared
    @Published var chars = [Character]()

    func initialize(episode: EpisodeResult) {
        getCharNamesInThisEpisode(episode: episode)
    }
    
    func getCharNamesInThisEpisode(episode: EpisodeResult) -> [Character] {
        for char in episode.characters! {
            service.fetchOnlyCharRequest(url: char) { [weak self] response in
                switch response {
                case .success(let model):
                    self?.chars.append(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        return chars
    }

}
