//
//  ContentView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store = Store()
    
    var body: some View {
        NavigationStack {
            Group {
                if store.state.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = store.state.errorMessage {
                    VStack(spacing: 12) {
                        Text("Failed to load data")
                            .font(.headline)
                        
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Retry") {
                            store.send(.fetchCoins)
                        }
                    }
                    .padding()
                    
                } else {
                    List(store.state.coins) { coin in
                        NavigationLink(destination: CoinDetailView(coin: coin)) {
                            CoinRowView(coin: coin)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        store.send(.fetchCoins)
                    }
                }
            }
            .navigationTitle("Crypto")
            .task {
                if store.state.coins.isEmpty {
                    store.send(.fetchCoins)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

