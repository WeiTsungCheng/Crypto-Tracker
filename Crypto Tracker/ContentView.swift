//
//  ContentView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store = Store()
    
    @State private var coins: [Coin] = []
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    
    
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
                        VStack(alignment: .leading, spacing: 4) {
                            Text(coin.name)
                                .font(.headline)
                            
                            Text(coin.symbol.uppercased())
                            
                            Text("$\(coin.currentPrice, specifier: "%.2f")")
                                .font(.body)
                        }
                        .padding(.vertical, 4)
                        
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Crypto")
            .task {
                if coins.isEmpty {
                    store.send(.fetchCoins)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

