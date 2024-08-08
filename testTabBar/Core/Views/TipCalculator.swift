//
//  AboutView.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 23. 12. 2023..
//

import SwiftUI

struct TipCalculator: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @FocusState private var isInputActive: Bool
    
    private var tipPercentages = [10, 15, 20, 25, 0]
    private var subTotal: Double { Double(checkAmount) ?? 0}
    
    private var subTotalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / peopleCount
    }
    
    private var tipValue: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / 100 * tipSelection
    }
    
    private var tipValuePerPerson: Double { tipValue / Double(numberOfPeople) }
    
    private var totalAmountWithTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = totalAmountWithTip / peopleCount
        
        return amountPerPerson
    }
    
    // This initializer customises apperance of all UISegmentedControl instances in the app to have an indigo tint color for the selected segment. This change is applied globally across the entire app, ensuring a consistent appearance.
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.indigo)
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                CardView(cardLaabelText: "PER PERSON", totalAmount: totalPerPerson, subTotalAmount: subTotalPerPerson, tipAmount: tipValuePerPerson)
                    .frame(width: geo.size.width, height: 100)
                
                CardView(cardLaabelText: "TOTAL", totalAmount: totalAmountWithTip, subTotalAmount: subTotal, tipAmount: tipValue)
                    .frame(width: geo.size.width, height: 100)
                
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0..<tipPercentages.count) {index in
                        Text("\(self.tipPercentages[index])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle()) // Changes default picker style to Segmented picker style
                
                TitleView(title: "BILL AMOUNT")
                
                HStack {
                    Text("€")
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .bold, design: .monospaced))
                    
                    TextField("Amount", text: $checkAmount)
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .keyboardType(.decimalPad) // Opens decimal pad keyboard instead of regular keyboard with letters
                    
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for:
                                     nil)
                                    isInputActive = false
                                }
                            }
                        }
                }
                TitleView(title: "SPLIT")
                GuestCountView(guestCount: $numberOfPeople)
            }
        }
        .padding()
    }
}

struct TipCalculator_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculator()
    }
}

struct TitleView: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.indigo)
                .fontWeight(.black)
            Spacer()
        }
    }
}
