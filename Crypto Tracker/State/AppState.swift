//
//  AppState.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

struct AppState {
    var coins: [Coin] = []
    var isLoading: Bool = false
    var errorMessage: String?
    // favorite
    var favoriteCoinIDs: Set<String> = []
}
