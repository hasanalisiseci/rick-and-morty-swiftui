//
//  PopupView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 19.01.2022.
//

import SwiftUI

struct PopupView: View {

    var selectedCharacter: Character?

    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: selectedCharacter?.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(8)
                    .padding(.top, 20)
            } placeholder: {
                RoundedRectangle(cornerRadius: 4)
                    .overlay(ProgressView())
                    .cornerRadius(8)
            }
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.top, 20)
            VStack(alignment: .leading, spacing: 5) {
                Text("Status: \((selectedCharacter?.status?.rawValue)!)")
                Text("Species: \((selectedCharacter?.species?.rawValue)!)")
                Text("Gender: \((selectedCharacter?.gender?.rawValue)!)")
                Text("From: \((selectedCharacter?.origin?.name)!)")
                Text("Live at: \((selectedCharacter?.location?.name)!)")
                Text("Episodes with \((selectedCharacter?.name)!)")
                ScrollView(.horizontal) {
                    HStack(spacing: 5) {
                        ForEach((selectedCharacter?.episode)!, id:\.self) { episode in
                            Button() {

                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .foregroundColor(.purple)
                                    Text("\(episode.getEpisodeNumber())")
                                }
                            }

                        }
                    }.frame(height: 50)
                }
            }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}

//MARK: - Text Modifier Example
//struct TextModifier: ViewModifier {
//    let font: Font
//
//    func body(content: Content) -> some View {
//        content
//            .font(font)
//    }
//}
