//
//  Coin.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 3. 2. 2024..
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let marketCapRank: Int
    
    // Enum used so we can assign the actual key and assign value of that key name to the variable. Then we name our variables how we want (camelCase in Coin struct).
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
    }
}
