//
//  Coin.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import Foundation


struct Coin: Identifiable {
    let id: String
    let name: String
    let symbol: String
    let currentPrice: Double
    let marketCapRank: Int?
    let high24h: Double?
    let low24h: Double?
    let priceChangePercentage24h: Double?
}

// DTO: Data Transfer Object
struct CoinDTO: Codable {
    let id: String
    let name: String
    let symbol: String
    let currentPrice: Double
    let marketCapRank: Int?
    let high24h: Double?
    let low24h: Double?
    let priceChangePercentage24h: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
    
    func toDomain() -> Coin {
        Coin(id: id,
             name: name,
             symbol: symbol,
             currentPrice: currentPrice,
             marketCapRank: marketCapRank,
             high24h: high24h,
             low24h: low24h,
             priceChangePercentage24h:
                priceChangePercentage24h)
    }
}



