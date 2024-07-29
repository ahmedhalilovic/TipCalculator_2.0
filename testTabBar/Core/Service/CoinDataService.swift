//
//  CoinDataService.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 3. 2. 2024..
//

import Foundation

class CoinDataService {
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=20&page=1&sparkline=false&locale=en"
    
    func fetchCoins() async throws -> [Coin] {
        guard let url = URL(string: urlString) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            
            return coins
        } catch {
            print("DEBUG: \(error.localizedDescription)")
            return []
        }
    }
    
}

// Link to API requests: https://www.coingecko.com/api/documentation
