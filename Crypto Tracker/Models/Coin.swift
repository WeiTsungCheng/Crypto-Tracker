//
//  Coin.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

struct Coin: Identifiable, Codable {
    let id: String
    let name: String
    let symbol: String
    let currentPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case currentPrice = "current_price"
    }
}
