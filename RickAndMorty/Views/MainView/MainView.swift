//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 16.01.2022.
//

import SwiftUI

struct MainView: View {


    var body: some View {
        TabView {
            CharactersTabView()
                .tabItem {
                Image(systemName: "person.3")
                Text("Characters")
            }
            EpisodesTabView()
                .tabItem {
                Image(systemName: "list.and.film")
                Text("Episodes")
            }
            LocationTabView()
                .tabItem {
                Image(systemName: "mappin.and.ellipse")
                Text("Locations")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
