//
//  Crypto_TrackerApp.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import SwiftUI

@main
struct Crypto_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            CoinListView(api: APIService())
        }
    }
}
