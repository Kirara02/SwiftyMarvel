//
//  CharacterProfileView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 29/11/24.
//

import SwiftUI

struct CharacterProfileView: View {
    let character: Character
    
    @StateObject var viewModel = Resolver.shared.resolve(CharacterProfileViewModel.self)
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .topLeading) {
                    coverImageView
                    contentView
                }//: ZStack
            }//: ScrollView
            .scrollIndicators(.hidden)
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(.hidden, for: .navigationBar)
            .ignoresSafeArea()
            .onAppear {
                Task {
                    viewModel.checkFavorite(character: character)
                    await viewModel.loadComics(forCharacter: character.id ?? 0)
                }
            }
        }
    }
    
    private var coverImageView: some View {
        CachedImageView(url: character.thumbnailURL)
            .aspectRatio(contentMode: .fill)
            .frame(
                height: 350,
                alignment: .center
            )
            .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
    }
    
    private var contentView: some View {
        LazyVStack(alignment: .leading) {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                Spacer()
                Button {
                    viewModel.toggleFavorite(character: character)
                } label: {
                    Image(
                        systemName: viewModel.isFavorite ?
                        "heart.fill" : "heart"
                    )
                    .foregroundColor(
                        viewModel.isFavorite ?
                            .red : .white
                    )
                    .font(.system(size: 20))
                }
                .padding([.leading, .trailing], 20)
            }
            .padding([.top], 60)
            Spacer()
                .frame(height: 280)
            Text(character.name ?? "")
                .font(.system(.largeTitle, weight: .bold))
                .padding([.bottom], 10)
            
            Text(character.safeDescription)
                .font(.body)
                .padding([.bottom], 10)
            
            comicsSection
            
        }//: VStack
        .padding([.leading, .bottom], 20)
    }
    
    private var comicsSection: some View {
        BaseStateView(viewModel: viewModel) {
            VStack(alignment: .leading) {
                Text("comics".localized())
                    .font(.system(.title2, weight: .bold))
                    .padding([.bottom], 5)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.comics) { item in
                            ComicItemView(comic: item)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CharacterProfileView(character: Character.dummyCharacter())
}
