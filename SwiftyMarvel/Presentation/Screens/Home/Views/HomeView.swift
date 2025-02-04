//
//  HomeViews.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(HomeViewModel.self)
    
    
    var body: some View {
        NavigationStack {
            BaseStateView(viewModel: viewModel) {
               content
                   .padding([.leading, .trailing], 15)
                   .navigationTitle("swiftyMarvel".localized())
                   .searchable(text: $viewModel.searchText,
                               prompt: "typeCharacterName".localized())
                   .onChange(of: viewModel.debouncedSearchText, perform: { _ in
                       Task {
                           await viewModel.searchCharacters()
                       }
                   })
           }
        }
    }
    
    var content: some View {
        CustomListView(items: viewModel.characters) { item in
            CharacterProfileView(character: item)
        } itemView: { item in
            CharacterView(character: item)
                .task {
                    await viewModel.loadMoreCharactersIfNeeded(currentItem: item)
                }
        }
    }
}

#Preview {
    HomeView()
}
