//
//  CachedImageView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI
import NukeUI

struct CachedImageView: View {
    let url: URL?

    var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image.resizable()
            } else if state.error != nil {
                errorView
            } else {
                loadingView
            }
        }
    }
    
    private var loadingView: some View {
        ZStack(alignment: .center) {
            Color.gray.aspectRatio(contentMode: .fill)
            ProgressView()
        }
    }
    
    private var errorView: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
        CachedImageView(url: URL(string: "https://example.com/image.jpeg"))
}
