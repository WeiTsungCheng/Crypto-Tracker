//
//  CoinCacheStore.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 07/05/2026.
//

import Foundation

protocol CoinCacheStoreProtocol {
    func saveCoins(_ coins: [CoinDTO]) throws -> Void
    func loadCoins() throws -> [CoinDTO]
}

final class CoinCacheStore: CoinCacheStoreProtocol {
    private let fileManager: FileManager
    private let fileName = "cached_coins.json"
    
    init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
    
    func saveCoins(_ coins: [CoinDTO]) throws -> Void {
        let data = try JSONEncoder().encode(coins)
        do {
            try data.write(to: cachedURL)
        } catch {
            print("cached coins save error")
        }
    }
    
    func loadCoins() throws -> [CoinDTO] {
        do {
            let data = try Data(contentsOf: cachedURL)
            let coins = try JSONDecoder().decode([CoinDTO].self, from: data)
            return coins
        } catch {
            print("get cached coins error")
        }
         
        return []
    }
    
    private var cachedURL: URL {
        return fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
    }
    
}
