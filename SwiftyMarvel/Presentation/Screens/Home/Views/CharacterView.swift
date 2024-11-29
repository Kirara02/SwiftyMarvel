//
//  CharacterView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI

struct CharacterView: View {
    
    // MARK: - Properties -

    let character: Character
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CachedImageView(url: character.thumbnailURL)
                .aspectRatio(2/1, contentMode: .fit)
                .cornerRadius(15)
                .frame(
                    alignment: .center
                )
            ZStack {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .frame(height: 50)
                    .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                Text(character.name ?? "")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }//: ZStack
        }
    }
}

#Preview {
    CharacterView(character: Character.dummyCharacter())
}
