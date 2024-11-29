//
//  SwiftyMarvelApp.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import SwiftUI

@main
struct SwiftyMarvelApp: App {
    
    init() {
        Resolver.shared.injectModules()
    }
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
    }
}
