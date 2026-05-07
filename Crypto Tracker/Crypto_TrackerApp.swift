//
//  Crypto_TrackerApp.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import SwiftUI
import Foundation

@main
struct Crypto_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            CoinListView(repository: CoinRepository(apiService: APIService(), cacheStore: CoinCacheStore(fileManager: FileManager.default)))
        }
    }
}
