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
        ZStack(alignment: .bottom) {
                Image("\(location!.name!)")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width-30, height: UIScreen.main.bounds.size.height/5, alignment: .center)
                    .foregroundColor(Color.green)
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.size.width-30, height: 70)
                    .opacity(0.7)
                VStack(alignment: .leading,spacing: 10) {
                            Text((location?.name)!)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                
                }.padding(.trailing, 20)
            }
        }
    }
}

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCellView()
    }
}
