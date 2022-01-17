//
//  LocationCellView.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 17.01.2022.
//

import SwiftUI

struct LocationCellView: View {
    
    var location: LocationResult?
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 121, height: 121, alignment: .center)
                            .foregroundColor(Color.green)
                              Text(location?.name?.prefix(1) ?? "E")
                                .fontWeight(.bold)
                                .font(.system(size: 60))
                    }
                }
                HStack {
                    VStack(spacing: 10) {
                        HStack {
                            Text(location?.name ?? "Earth (C-137)")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack {
                            Text(location?.type ?? "Planet")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack {
                            Text(location?.dimension ?? "Dimension C-137")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCellView()
    }
}
