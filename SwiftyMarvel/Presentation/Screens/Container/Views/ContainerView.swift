//
//  ContainerView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    ContainerView()
}
