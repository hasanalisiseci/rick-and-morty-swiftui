//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import SwiftUI

struct EpisodeDetailView: View {

    var episode: EpisodeResult?
    @ObservedObject var charactersThisEpisode = EpisodeDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "tv")
                        .font(.system(size: 20))
                    Text(episode?.name ?? "Lawnmower Dog")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack {
                    Image(systemName: "calendar")
                        .font(.system(size: 20))
                        .padding(.leading, 2)
                    Text(episode?.airDate ?? "December 2, 2013")
                        .font(.system(size: 15))
                        .padding(.leading, 3)
                    Spacer()

                }
                Divider()
                    .foregroundColor(Color.black)
                Text("Characters in This Episode")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
                Spacer(minLength: 10)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach((charactersThisEpisode.chars)) { character in
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: URL(string: character.image ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .cornerRadius(8)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.red)
                                    .frame(width: 150, height: 150, alignment: .center)
                                    .overlay(ProgressView())
                                    .cornerRadius(8)
                            }
                            RoundedRectangle(cornerRadius: 4)
                                .opacity(0.7)
                                .frame(width: 150, height: 50)
                            Text(character.name ?? "")
                                .foregroundColor(Color.white)
                                .padding(.bottom, 10)
                        }
                    }
                }

                    .onAppear() {
                    charactersThisEpisode.initialize(episode: episode!)
                }

            }.padding(10)
                .navigationTitle(episode?.episode ?? "S01E01")
        }

    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView()
    }
}
