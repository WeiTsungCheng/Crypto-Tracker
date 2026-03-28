//
//  ContentView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Loading....")
                .navigationTitle("Crypo")
                .task {
                    await loadCoins()
                }
        }
    }
    
    private func loadCoins() async {
        do {
            let coins = try await APIService.fetchCoins()
            print("fetch coins count: \(coins.count)")
            
            for coin in coins.prefix(10) {
                print("\(coin.name) - \(coin.currentPrice)")
            }
        } catch {
            print("Failed to fetch coins: \(error)")
        }
    }
}


#Preview {
    ContentView()
}
