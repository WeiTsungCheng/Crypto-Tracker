//
//  PersistenceService.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 29/03/2026.
//

import Foundation

struct PersistenceService {
    private static let key = "favorite_coins"
    
    static func saveFavorites(_ ids: Set<String>) {
        let array = Array(ids)
        UserDefaults.standard.set(array, forKey: key)
    }
    
    static func loadFavorites() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: key) ?? []
        return Set(array)
    }
}
