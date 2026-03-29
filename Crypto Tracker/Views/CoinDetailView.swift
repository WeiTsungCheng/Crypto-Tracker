//
//  CoinDetailView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 29/03/2026.
//

import SwiftUI

struct CoinDetailView: View {
    
    let coin: Coin
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                headerSection
                priceSection
                marketSection
            }
            .padding(20)
        }
        .navigationTitle(coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(coin.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(coin.symbol.uppercased())
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }

    private var priceSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Price Information")
                .font(.headline)

            infoRow(title: "Current Price", value: "$\(coin.currentPrice)")

            if let high24h = coin.high24h {
                infoRow(title: "24h High", value: "$\(high24h)")
            }

            if let low24h = coin.low24h {
                infoRow(title: "24h Low", value: "$\(low24h)")
            }

            if let change = coin.priceChangePercentage24h {
                infoRow(title: "24h Change", value: "\(change)")
            }
        }
    }

    private var marketSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Market Information")
                .font(.headline)

            if let rank = coin.marketCapRank {
                infoRow(title: "Market Cap Rank", value: "#\(rank)")
            }
        }
    }
    
    private func infoRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)

            Spacer()

            Text(value)
                .fontWeight(.medium)
        }
    }
    
}

#Preview {
    NavigationStack {
        CoinDetailView(
            coin: Coin(
                id: "bitcoin",
                name: "Bitcoin",
                symbol: "btc",
                currentPrice: 65000,
                marketCapRank: 1,
                high24h: 66000,
                low24h: 64000,
                priceChangePercentage24h: 1.25
            )
        )
    }

}
