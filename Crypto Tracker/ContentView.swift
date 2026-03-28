//
//  ContentView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var coins: [Coin] = []
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    
    
    var body: some View {
        NavigationStack {
            Group {
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = errorMessage {
                    VStack(spacing: 12) {
                        Text("Failed to load data")
                            .font(.headline)
                        
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Retry") {
                            Task {
                                await loadCoins()
                            }
                        }
                    }
                    .padding()
                    
                } else {
                    List(coins) { coin in
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
                    await loadCoins()
                }
            }
        }
    }
    
    private func loadCoins() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchCoins = try await APIService.fetchCoins()
            coins = fetchCoins
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
      
    }
}


#Preview {
    ContentView()
}
