//
//  MessageView.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI

struct MessageView: View {
    let message: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(message)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

#Preview {
    MessageView(message: "Hallo Kirara Bernstein")
}
