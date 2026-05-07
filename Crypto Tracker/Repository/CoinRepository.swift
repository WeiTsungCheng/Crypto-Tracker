//
//  CoinRepository.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 07/05/2026.
//

protocol CoinRepositoryProtocol {
    func fetchCoins() async throws -> [Coin]
}

final class CoinRepository: CoinRepositoryProtocol {
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchCoins() async throws -> [Coin] {
        return try await apiService.fetchCoins()
    }
    
}
