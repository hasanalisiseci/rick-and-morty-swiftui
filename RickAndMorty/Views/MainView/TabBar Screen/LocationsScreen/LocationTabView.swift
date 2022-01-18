//
//  LocationTabView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import SwiftUI

struct LocationTabView: View {

    @ObservedObject var locationViewModel = LocationViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(locationViewModel.locationResponse) { location in
                            VStack {
                                NavigationLink(destination: LocationDetailView(location: location)) {
                                    LocationCellView(location: location)
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
                    locationViewModel.initialize()
                }
            }
                .navigationTitle("Locations")
        }
    }
}

struct LocationTabView_Previews: PreviewProvider {
    static var previews: some View {
        LocationTabView()
    }
}
