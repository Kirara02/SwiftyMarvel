//
//  FavoritesView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(FavoritesViewModel.self)
    
    var body: some View {
        NavigationStack {
            BaseStateView(viewModel: viewModel) {
                content
                    .padding([.leading, .trailing], 15)
            }
            .navigationTitle("Favorites")
        }
        .task {
            viewModel.getFavorites()
        }
    }
    
    var content: some View {
        CustomListView(items: viewModel.favorites) { item in
            CharacterProfileView(character: item)
        } itemView: { item in
            CharacterView(character: item)
        }
        .refreshable {
            viewModel.getFavorites()
        }
    }
}

#Preview {
    FavoritesView()
}
