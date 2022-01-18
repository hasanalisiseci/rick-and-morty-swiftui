//
//  LocationDetailView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 18.01.2022.
//

import SwiftUI

struct LocationDetailView: View {

    var location: LocationResult?
    @ObservedObject var residentThisLocation = LocationDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("\(location!.name!)")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.size.width-30, height: UIScreen.main.bounds.size.height/4, alignment: .center)
                    .foregroundColor(Color.green)
                HStack {
                    Image(systemName: "map")
                        .font(.system(size: 20))
                    Text(location?.dimension ?? "Dimension C-137")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack {
                    Image(systemName: "paperclip")
                        .font(.system(size: 20))
                        .padding(.leading, 2)
                    Text(location?.type ?? "Planet")
                        .font(.system(size: 15))
                        .padding(.leading, 3)
                    Spacer()

                }
                Divider()
                    .foregroundColor(Color.black)
                Text("Resident in This Locations")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
                Spacer(minLength: 10)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach((residentThisLocation.chars)) { character in
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
                                .padding(10)
                        }
                    }
                }

                    .onAppear() {
                        residentThisLocation.initialize(location: location!)
                }

            }.padding(10)
                .navigationTitle(location?.name ?? "Earth (C-137)")
        }

    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView()
    }
}
