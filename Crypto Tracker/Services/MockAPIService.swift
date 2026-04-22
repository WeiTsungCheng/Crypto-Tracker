//
//  MockAPIService.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 22/04/2026.
//


class MockAPIService: APIServiceProtocol {
    
    func fetchCoins() async throws -> [Coin] {
        
        let mockCoins: [Coin] = [
            Coin(id: "pickacoin", name: "PickaCoin", symbol: "PKC", currentPrice: 65000, marketCapRank: 1, high24h: 66000, low24h: 64000, priceChangePercentage24h: 1.2),
            Coin(id: "ethereum", name: "Ethereum", symbol: "ETH", currentPrice: 3200, marketCapRank: 2, high24h: 3300, low24h: 3100, priceChangePercentage24h: -0.8),
            Coin(id: "tether", name: "Tether", symbol: "USDT", currentPrice: 1.0, marketCapRank: 3, high24h: 1.01, low24h: 0.99, priceChangePercentage24h: 0.0),
            Coin(id: "bnb", name: "BNB", symbol: "BNB", currentPrice: 580, marketCapRank: 4, high24h: 600, low24h: 570, priceChangePercentage24h: 2.5),
            Coin(id: "solana", name: "Solana", symbol: "SOL", currentPrice: 150, marketCapRank: 5, high24h: 155, low24h: 145, priceChangePercentage24h: 3.1),
            Coin(id: "xrp", name: "XRP", symbol: "XRP", currentPrice: 0.55, marketCapRank: 6, high24h: 0.58, low24h: 0.53, priceChangePercentage24h: -1.3),
            Coin(id: "cardano", name: "Cardano", symbol: "ADA", currentPrice: 0.45, marketCapRank: 7, high24h: 0.47, low24h: 0.43, priceChangePercentage24h: 0.9),
            Coin(id: "dogecoin", name: "Dogecoin", symbol: "DOGE", currentPrice: 0.12, marketCapRank: 8, high24h: 0.13, low24h: 0.11, priceChangePercentage24h: 4.2),
            Coin(id: "tron", name: "Tron", symbol: "TRX", currentPrice: 0.11, marketCapRank: 9, high24h: 0.115, low24h: 0.105, priceChangePercentage24h: 1.7),
            Coin(id: "polkadot", name: "Polkadot", symbol: "DOT", currentPrice: 6.5, marketCapRank: 10, high24h: 6.8, low24h: 6.2, priceChangePercentage24h: -2.0),
            Coin(id: "polygon", name: "Polygon", symbol: "MATIC", currentPrice: 0.9, marketCapRank: 11, high24h: 0.95, low24h: 0.85, priceChangePercentage24h: 2.8),
            Coin(id: "litecoin", name: "Litecoin", symbol: "LTC", currentPrice: 85, marketCapRank: 12, high24h: 88, low24h: 82, priceChangePercentage24h: -0.5),
            Coin(id: "chainlink", name: "Chainlink", symbol: "LINK", currentPrice: 14, marketCapRank: 13, high24h: 14.5, low24h: 13.5, priceChangePercentage24h: 1.1),
            Coin(id: "stellar", name: "Stellar", symbol: "XLM", currentPrice: 0.13, marketCapRank: 14, high24h: 0.135, low24h: 0.125, priceChangePercentage24h: 0.6),
            Coin(id: "avalanche", name: "Avalanche", symbol: "AVAX", currentPrice: 35, marketCapRank: 15, high24h: 36, low24h: 34, priceChangePercentage24h: 2.3)
        ]
        
        return mockCoins
    }
    
}
