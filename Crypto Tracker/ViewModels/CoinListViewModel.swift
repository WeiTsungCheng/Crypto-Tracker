//
//  CoinListViewModel.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 20/04/2026.
//

import Foundation
import Combine


@MainActor
final class CoinListViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let api: APIServiceProtocol
    
    init(api: APIServiceProtocol) {
        self.api = api
    }
    
    func loadCoins() async {
        isLoading = true
        errorMessage = nil
        
        do {
            coins = try await api.fetchCoins()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
}
