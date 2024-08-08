//
//  HomeView.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 23. 12. 2023..
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            NewsView()
            Text("Ola view")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

