//
//  AppAction.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 28/03/2026.
//

enum AppAction {
    case fetchCoins
    case fetchSuccess([Coin])
    case fetchFailed(String)
}
