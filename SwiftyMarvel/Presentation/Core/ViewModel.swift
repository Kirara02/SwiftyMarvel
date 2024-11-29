//
//  ViewModel.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var state: ViewState = .initial
}

enum ViewState: Equatable {
    case initial, loading, error(String), success, empty
}
