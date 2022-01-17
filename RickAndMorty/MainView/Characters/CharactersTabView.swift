//
//  CharacterTabView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import SwiftUI

struct CharactersTabView: View {
    
    @ObservedObject var viewModel = CharViewModel()
    
    @State var filter = ""

    
    var body: some View {
        NavigationView {

                ScrollView {
                    VStack {
                        HStack(spacing: 20) {
                            Button {
                                filter = ""
                                viewModel.initialize(filter: filter)
                                print(filter)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 50, height: 30, alignment: .center)
                                    Text("Main")
                                        .foregroundColor(Color.white)
                                }
                            }
                            Button {
                                filter = "alive"
                                viewModel.initialize(filter: filter)
                                print("filter")
                                
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30, alignment: .center)
                                        .foregroundColor(Color.green)
                                    Text("Alive")
                                        .foregroundColor(Color.white)
                                    
                                }
                            }
                            Button {
                                filter = "dead"
                                viewModel.initialize(filter: filter)
                                print(filter)

                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30, alignment: .center)
                                        .foregroundColor(Color.red)
                                    Text("Dead")
                                        .foregroundColor(Color.white)
                                }
                            }
                            Button {
                                filter = "unknown"
                                viewModel.initialize(filter: filter)
                                print(filter)

                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 80, height: 30, alignment: .center)
                                        .foregroundColor(Color.gray)
                                    Text("Unknown")
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.rickAndMortyResponse) { character in
                            VStack {
                                CharCellView(character: character)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                                Divider()
                            }
                        }
                    }
                }
                    .onAppear() {
                        viewModel.initialize(filter: filter)
                    }
            }
                .navigationTitle("\(filter == "" ? "Main" : "\(filter.capitalizingFirstLetter())") Characters ")
        }
    }
}

struct CharacterTabView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersTabView()
    }
}
