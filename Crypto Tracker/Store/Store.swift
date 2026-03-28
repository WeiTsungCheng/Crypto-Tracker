//
//  Store.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

import Foundation
import Combine

@MainActor
final class Store: ObservableObject {
    
    @Published private(set) var state = AppState()
    
    func send(_ action: AppAction) {
        appReducer(state: &state, action: action)
        
        switch action {
        case .fetchCoins:
            Task {
                await fetchCoins()
            }
        case .fetchSuccess, .fetchFailed:
            break
        }
    }

    private func fetchCoins() async {
         do {
             let fetchedCoins = try await APIService.fetchCoins()
             send(.fetchSuccess(Array(fetchedCoins.prefix(20))))
         } catch {
             send(.fetchFailed(error.localizedDescription))
         }
     }
    
}
