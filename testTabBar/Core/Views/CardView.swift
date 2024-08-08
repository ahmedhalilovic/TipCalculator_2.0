//
//  CardView.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 3. 8. 2024..
//

import SwiftUI

struct CardView: View {
    var cardLaabelText = ""
    var totalAmount = 22.22
    var subTotalAmount = 33.33
    var tipAmount = 44.44
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(cardLaabelText)
                .foregroundColor(.indigo)
                .fontWeight(.black)
            
            ZStack {
                Text(cardLaabelText)
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                
                HStack {
                    Spacer()
                    
                    Text("$ \(totalAmount, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .black, design: .monospaced))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .frame(width: 1, height: 70)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("SUBTOTAL")
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.light)
                            Text("$ \(subTotalAmount, specifier: "%.2f")")
                                .font(.system(.body, design: .monospaced))
                                .fontWeight(.black)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("TIP")
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.light)
                                Text("$ \(tipAmount, specifier: "%.2f")")
                                    .font(.system(.body, design: .monospaced))
                                    .fontWeight(.black)
                            }
                        }
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(5)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardLaabelText: "PER PERSON")
            .frame(width: 350, height: 120)
    }
}
