//
//  ContentView.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 22. 12. 2023..
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationTitle("Home")
            }
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            NavigationView {
                TipCalculator()
                    .navigationTitle("Tip Calculator")
            }
                .tabItem {
                    Label("Tip Calculator", systemImage: "book")
                }
            NavigationView {
                FavouritesView()
                    .navigationTitle("Coins")
            }
                .tabItem {
                    Label("Coins", systemImage: "bitcoinsign")
                }
            NavigationView {
                SpecificationView()
                    .navigationTitle("Specs")
            }
                .tabItem {
                    Label("Specs", systemImage: "gear")
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
