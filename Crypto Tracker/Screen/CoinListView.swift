//
//  CoinListView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 20/04/2026.
//
import SwiftUI

struct CoinListView: View {
    
    @StateObject var vm: CoinListViewModel
    
    init(api: APIServiceProtocol) {
        _vm = StateObject(wrappedValue: CoinListViewModel(api: api))
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if vm.isLoading {
                    LoadingView()
                    
                } else if let errorMessage = vm.errorMessage {
                    ErrorStateView(errorMessage: errorMessage) {
                        Task {
                            await vm.loadCoins()
                        }
                    }
                    
                } else if vm.coins.isEmpty {
                    
                    EmptyStateView {
                        Task {
                            await vm.loadCoins()
                        }
                    }
                    
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



struct LoadingView: View {
    let title: String
    
    init(title: String = "Loading...") {
        self.title = title
    }
    
    var body: some View {
        VStack(spacing: 12) {
            ProgressView()
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct ErrorStateView: View {
    
    let title: String
    let errorMessage: String
    let action: () -> Void
    
    init(title: String = "Failed to load data", errorMessage: String, retryAction: @escaping () -> Void) {
        self.title = title
        self.errorMessage = errorMessage
        self.action = retryAction
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Failed to load data")
                .font(.headline)
            
            Text(errorMessage)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Button("Retry") {
                action()
            }
        }
    }
}

struct EmptyStateView: View {
    
    let title: String
    let message: String
    let actionTitle: String
    let action: () -> Void
    
    init(
        title: String = "No coins available",
        message: String = "Please try again later.",
        actionTitle: String = "Retry",
        retryAction: @escaping () -> Void
    ) {
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
        self.action = retryAction
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)
            Text("Please try again later.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Button("Retry") {
                action()
            }
        }
        .padding()
    }
    
}

#Preview {
    CoinListView(api: APIService())
}
