//
//  FavouritesView.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 22. 12. 2023..
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                DisclosureGroup {
                    Text("Price: \(NumberFormatter.localizedString(from: NSNumber(value: coin.currentPrice), number: .currency))")
                } label: {
                    
                    HStack(spacing: 32) {
                        Text("\(coin.marketCapRank)")
                            .foregroundStyle(.gray)
                        
                        VStack {
                            Text(coin.name)
                                .fontWeight(.semibold)
                            Text(coin.symbol.uppercased())
                        }
                    }
                    .font(.footnote)
                }
            }
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
