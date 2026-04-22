//
//  CoinListViewModel.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 20/04/2026.
//

import Foundation

@Observable
@MainActor
final class CoinListViewModel {
    
    private(set) var coins: [Coin] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    private(set) var favoriteCoinIDs: Set<String> = []
    
    private let api: APIServiceProtocol
    
    init(api: APIServiceProtocol) {
        self.api = api
    }
    
    func loadCoins() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            coins = try await api.fetchCoins()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func isFavorite(id: String) -> Bool {
        return favoriteCoinIDs.contains(id)
    }
    
    func toggleFavorite(id: String) {
        if favoriteCoinIDs.contains(id) {
            favoriteCoinIDs.remove(id)
        } else {
            favoriteCoinIDs.insert(id)
        }
        PersistenceService.saveFavorites(favoriteCoinIDs)
    }
    
    func loadFavorites() {
        favoriteCoinIDs = PersistenceService.loadFavorites()
    }
    
    
}
