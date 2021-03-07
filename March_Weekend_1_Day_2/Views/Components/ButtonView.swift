//
//  ButtonView.swift
//  March_Weekend_1_Day_2
//
//  Created by MD Tanvir Alam on 7/3/21.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var calculatorVM:CalculatorViewModel
    var number:String
    var buttonWidth:CGFloat
    var color:Color = Color.yellow
    var body: some View {
        Text(number)
            .frame(width:buttonWidth,height: buttonWidth)
            .background(color)
            .onTapGesture {
                if number == "="{
                    calculatorVM.equalButtonPressed()
                }
                else if number == "C"{
                    calculatorVM.cButtoPressed()
                }
                else{
                    calculatorVM.calculatorScreen.append("\(number)")
                }
                
            }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(number: "1", buttonWidth: 20, color: Color.black)
    }
}
