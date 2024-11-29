//
//  ComicItemView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 29/11/24.
//

import SwiftUI

struct ComicItemView: View {
    let comic: Comic
    var body: some View {
        VStack(alignment: .center) {
            CachedImageView(url: comic.thumbnailURL)
                .aspectRatio(2/3, contentMode: .fit)
                .cornerRadius(15)
                .frame(height: 200)
            Text(comic.title ?? "")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(.headline)
                .frame(width: 150)
        }
        .padding([.leading], 10)
    }
}

#Preview {
    ComicItemView(comic: Comic.dummyComic())
}
