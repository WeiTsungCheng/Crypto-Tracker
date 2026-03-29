//
//  CoinRowView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 29/03/2026.
//
import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.headline)
                
                Text(coin.symbol.uppercased())
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("$\(coin.currentPrice, specifier: "%.2f")")
                    .font(.body)
                
                if let change = coin.priceChangePercentage24h {
                    Text("\(change, specifier: "%.2f")%")
                        .font(.subheadline)
                        .foregroundColor(change >= 0 ? .green : .red)
                }
            }
        }
        .padding(.vertical, 4)
    }
}



#Preview {
    CoinRowView(coin: Coin(
        id: "bitcoin",
        name: "Bitcoin",
        symbol: "btc",
        currentPrice: 65000,
        marketCapRank: 1,
        high24h: 66000,
        low24h: 64000,
        priceChangePercentage24h: 1.25
    ))
}
