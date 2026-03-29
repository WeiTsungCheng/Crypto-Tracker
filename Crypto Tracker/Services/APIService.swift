//
//  APIService.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
}

struct APIService {
    
    static func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=gbp") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url) as (Data, URLResponse)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        
        return try decoder.decode([Coin].self, from: data)
        
        
    }
}
