//
//  View+Extension.swift
//  RickAndMorty
//
//  Created by Hasan Ali Şişeci on 19.01.2022.
//
import SwiftUI

// MARK: - Custom View Property Extensions

extension View {
    //MARK: - Building a Custom Modifier for Custom Popup Navigation View
    func popupNavigationView<Content: View>(horizantalPadding: CGFloat = 40, show: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        return self
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .overlay {
            if show.wrappedValue {
                //MARK: -Geometry Reader for reading Container Frame
                GeometryReader { proxy in

                    Color.primary
                        .opacity(0.15)
                        .ignoresSafeArea()

                    let size = proxy.size
                    NavigationView {
                        content()
                    }
                        .frame(width: size.width - horizantalPadding, height: size.height / 1.7, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
            }
        }
    }
}
