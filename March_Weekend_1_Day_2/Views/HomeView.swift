//
//  HomeView.swift
//  March_Weekend_1_Day_2
//
//  Created by MD Tanvir Alam on 7/3/21.
//

import SwiftUI

struct HomeView: View {
    let paddingHorizontal = 10
    let paddingbetweenButton = 2
    let deviceWidth = UIScreen.main.bounds.width
    @StateObject private var calculatorVM = CalculatorViewModel()
    var body: some View {
        let buttonWidth = (deviceWidth - CGFloat(((paddingHorizontal*2) + paddingbetweenButton*3))) / 4
        VStack(spacing:1){
            Text("Calculator")
                .font(.system(size: 27, weight: .bold))
            TextField("Calculate", text: $calculatorVM.calculatorScreen)
                .padding()
                .background(Color.white)
                .padding(.horizontal,CGFloat(paddingHorizontal))
            HStack(spacing:1){
                ButtonView(number: "6", buttonWidth: buttonWidth)
                ButtonView(number: "7", buttonWidth: buttonWidth)
                ButtonView(number: "8", buttonWidth: buttonWidth)
                ButtonView(number: "9", buttonWidth: buttonWidth)
            }
            HStack(spacing:1){
                ButtonView(number: "2", buttonWidth: buttonWidth)
                ButtonView(number: "3", buttonWidth: buttonWidth)
                ButtonView(number: "4", buttonWidth: buttonWidth)
                ButtonView(number: "5", buttonWidth: buttonWidth)
            }
            HStack(spacing:1){
                ButtonView(number: "-", buttonWidth: buttonWidth)
                ButtonView(number: "+", buttonWidth: buttonWidth)
                ButtonView(number: "0", buttonWidth: buttonWidth)
                ButtonView(number: "1", buttonWidth: buttonWidth)
            }
            HStack(spacing:1){
                ButtonView(number: "/", buttonWidth: buttonWidth)
                ButtonView(number: "*", buttonWidth: buttonWidth)
                ButtonView(number: ".", buttonWidth: buttonWidth)
                ButtonView(number: "C", buttonWidth: buttonWidth)
            }
            HStack(spacing:1){
                ButtonView(number: "=", buttonWidth: buttonWidth)
                    .frame(width: deviceWidth - CGFloat(paddingHorizontal*2))
                    .background(Color.yellow)
    
            }
            Spacer()
        }.frame(width:deviceWidth)
        .background(Color.green.edgesIgnoringSafeArea(.all))
        .environmentObject(calculatorVM)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
