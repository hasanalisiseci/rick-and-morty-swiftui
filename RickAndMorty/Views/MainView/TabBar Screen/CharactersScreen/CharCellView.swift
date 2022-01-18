//
//  CharCellView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import SwiftUI

struct CharCellView: View {
    var character: Character?
    @State private var showingAlert = false
    @State private var emoji: String = ""

    var body: some View {
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
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                    VStack(alignment: .leading) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height: 30)
                                .foregroundColor(.orange)
                            Text("Last known location: ")
                                .foregroundColor(.white)
                                .padding(1)
                        }
                        Text(character?.origin?.name ?? "Earth (C-137)")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }.padding(.top, 5)
            }
            Button {
                showingAlert.toggle()
                emoji = character?.status == .dead ? "😣" : character?.status == .alive ? "😎" : "🤔"
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(character?.status?.rawValue == "Alive" ? Color.green : character?.status?.rawValue == "Dead" ? Color.red : Color.gray)
                    Image(systemName: character?.status?.rawValue == "Alive" ? "heart.fill" : character?.status?.rawValue == "Dead" ? "battery.0" : "questionmark.circle.fill")
                        .foregroundColor(Color.white)
                        .frame(width: 20, height: 20, alignment: .center)
                }
            }
            Spacer()
        }.padding()
            .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("\((character?.status!.rawValue)!.uppercased()) \(emoji)"),
                message: Text("\((character?.name)!)'s status is \((character?.status!.rawValue)!.lowercased())"),
                dismissButton: .default(Text("OK")))
        }
    }
}

struct CharCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharCellView()
    }
}
