//
//  CharCellView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import SwiftUI

struct CharCellView: View {
    var character: Character?
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack {
                        AsyncImage(url: URL(string: character?.image ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 121, height: 121, alignment: .center)
                                .cornerRadius(8)
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.red)
                                .frame(width: 121, height: 121, alignment: .center)
                                .overlay(ProgressView())
                                .cornerRadius(8)
                        }
                }
                VStack(spacing: 10) {
                    HStack {
                        Text(character?.name ?? "Rick Sanchez")
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack {
                        Text(character?.status.rawValue ?? "Alive")
                            .font(.body)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack {
                        Text(character?.origin.name ?? "Earth (C-137)")
                            .font(.body)
                        .foregroundColor(.black)
                        Spacer()
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(character?.status.rawValue == "Alive" ? Color.green : character?.status.rawValue == "Dead" ? Color.red : Color.gray)
                    Image(systemName: character?.status.rawValue == "Alive" ? "heart.fill" : character?.status.rawValue == "Dead" ? "battery.0" : "questionmark.circle.fill")
                        .foregroundColor(Color.white)
                        .frame(width: 20, height: 20, alignment: .center)

                }
                Spacer()
            }.padding()
        }
    }
}

struct CharCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharCellView()
    }
}
