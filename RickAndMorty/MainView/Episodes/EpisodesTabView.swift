//
//  LocationTabView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import SwiftUI

struct EpisodesTabView: View {
    
    @ObservedObject var episodeViewModel = EpisodeViewModel()
    
    var body: some View {
        NavigationView {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(episodeViewModel.episodeResponse) { episode in
                            VStack {
                                NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                                    EpisodeCellView(episode: episode)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                }
                                Divider()
                            }
                        }
                    }
                }
                    .onAppear() {
                        episodeViewModel.initialize()
                    }
            .navigationTitle("Episodes")
        }
    }
}

struct EpisodesTabView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesTabView()
    }
}
