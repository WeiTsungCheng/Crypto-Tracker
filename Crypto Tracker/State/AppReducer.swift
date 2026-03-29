//
//  AppReducer.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    case .fetchCoins:
        state.isLoading = true
        state.errorMessage = nil
    case .fetchSuccess(let coins):
        state.coins = coins
        state.isLoading = false
    case .fetchFailed(let error):
        state.isLoading = false
        state.errorMessage = error
    // favorite
    case .toggleFavorite(let id):
        if state.favoriteCoinIDs.contains(id) {
            state.favoriteCoinIDs.remove(id)
        } else {
            state.favoriteCoinIDs.insert(id)
        }
    }
}
