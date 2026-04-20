//
//  APIService.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import Foundation


enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingFailed
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The request URL is invalid."
        case .invalidResponse:
            return "The server response is invalid."
        case .badStatusCode(let code):
            return "The server returned an error (\(code))."
        case .decodingFailed:
            return "Failed to decode the server response."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
    
}

protocol APIServiceProtocol {
    func fetchCoins() async throws -> [Coin]
}

class APIService: APIServiceProtocol {
    
    func fetchCoins() async throws -> [Coin] {
        
        let coinURL = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=gbp")
        guard let url = coinURL else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url) as (Data, URLResponse)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            let statusCode = httpResponse.statusCode
            guard 200..<300 ~= statusCode else {
                throw NetworkError.badStatusCode(statusCode)
            }
            
            do {
                let decoder = JSONDecoder()
                let dtos = try decoder.decode([CoinDTO].self, from: data)
                return dtos.map { $0.toDomain() }
            } catch {
                throw NetworkError.decodingFailed
            }
            
        } catch let error as NetworkError {
            throw error
            
        } catch {
            throw NetworkError.unknown(error)
        }
        
    }
}
