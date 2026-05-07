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
    private let cacheStore: CoinCacheStoreProtocol
    
    init(apiService: APIServiceProtocol, cacheStore: CoinCacheStoreProtocol) {
        self.apiService = apiService
        self.cacheStore = cacheStore
    }
    
    func fetchCoins() async throws -> [Coin] {
        do {
            let coinDTOs = try await apiService.fetchCoins()
            do {
                try cacheStore.saveCoins(coinDTOs)
                let coins = coinDTOs.map { $0.toDomain() }
                return coins
            } catch {
                print("save coins failed")
            }
            
        } catch {
            do {
                return try cacheStore.loadCoins().map { $0.toDomain() }
            } catch {
                print("fetch coins failed")
            }
        }
        return []
    }
    
}
