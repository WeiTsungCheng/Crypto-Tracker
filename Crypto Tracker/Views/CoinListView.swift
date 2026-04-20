//
//  CoinListView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 20/04/2026.
//
import SwiftUI

struct ConinListView: View {
    
    @StateObject private var vm = CoinListViewModel(api: APIService())
    
    var body: some View {
        List(vm.coins) { coin in
            Text(coin.name)
        }
        .overlay {
            if vm.isLoading {
                ProgressView("Loading...")
            }
        }
        .task {
            await vm.loadCoins()
        }
        
    }
    
}

#Preview {
    ConinListView()
}
