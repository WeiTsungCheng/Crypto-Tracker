//
//  CoinListView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 20/04/2026.
//
import SwiftUI

struct CoinListView: View {
    
    @StateObject private var vm = CoinListViewModel(api: APIService())
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    ProgressView("Loading...")
                    
                } else if let errorMessage = vm.errorMessage {
                    VStack(spacing: 12) {
                        Text("Failed to load data")
                            .font(.headline)
                        
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Retry") {
                            Task {
                                await vm.loadCoins()
                            }
                        }
                    }
                    
                } else if vm.coins.isEmpty {
                    
                    VStack(spacing: 12) {
                        Text("No coins available")
                            .font(.headline)
                        Text("Please try again later.")
                              .font(.subheadline)
                              .foregroundColor(.secondary)
                              .multilineTextAlignment(.center)

                          Button("Retry") {
                              Task {
                                  await vm.loadCoins()
                              }
                          }
                    }
                    .padding()
                    
                    
                } else {
                    
                    List(vm.coins) { coin in
                        
                        NavigationLink(destination: CoinDetailView(coin: coin)) {
                            CoinRowView(
                                coin: coin,
                                isFavorite: vm.isFavorite(id: coin.id), onFavoriteTapped: {
                                    vm.toggleFavorite(id: coin.id)
                                }
                            )
                        }
                        
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await vm.loadCoins()
                    }
                }
                
            }
            .navigationTitle("Crypto")
            .task {
                vm.loadFavoriteCoins()
                await vm.loadCoins()
            }
            
        }
       
        
        
    }
}

#Preview {
    CoinListView()
}
