//
//  CoinsViewModel.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 3. 2. 2024..
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init() {
        Task { try await fetchCoins() }
    }
    
    func fetchCoins() async throws {
        do {
            let fetchedCoins = try await service.fetchCoins()
            DispatchQueue.main.async {
                self.coins = fetchedCoins
            }
        } catch {
            
        }
    }
}
