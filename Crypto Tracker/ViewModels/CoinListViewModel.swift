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
    
    var searchText = ""
    var sortOption: SortOption = .marketCap
    
    var displayCoins: [Coin] {
        let filtered = coins.filter { coin in
            searchText.isEmpty || coin.name.localizedCaseInsensitiveContains(searchText) || coin.symbol.localizedCaseInsensitiveContains(searchText)
        }
        
        switch sortOption {
        case .marketCap:
            return filtered.sorted { $0.marketCapRank ?? Int.max < $1.marketCapRank ?? Int.max }
        case .priceHighToLow:
            return filtered.sorted { $0.currentPrice > $1.currentPrice }
        case .priceLowToHigh:
            return filtered.sorted { $0.currentPrice < $1.currentPrice }
        case .name:
            return filtered.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
        }
    }
    
    enum SortOption: String, CaseIterable, Identifiable {
        
        case marketCap = "Market Cap"
        case priceHighToLow = "Price ↓"
        case priceLowToHigh = "Price ↑"
        case name = "Name"
        
        var id: String {
            return rawValue
        }
    }
    
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
