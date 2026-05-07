//
//  CoinCacheStore.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 07/05/2026.
//

import Foundation

protocol CoinCacheStoreProtocol {
    func saveCoins(_ coins: [CoinDTO]) throws -> Void
    func getCoins() throws -> [CoinDTO]
}

final class CoinCacheStore: CoinCacheStoreProtocol {
    private let fileManager: FileManager
    private let fileName = "cached_coins.json"
    
    init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
    
    func saveCoins(_ coins: [CoinDTO]) throws -> Void {
        let data = try JSONEncoder().encode(coins)
        
    }
    
    func getCoins() throws -> [CoinDTO] {
        return []
    }
    
    
}
