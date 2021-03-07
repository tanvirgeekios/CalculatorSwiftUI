//
//  CalculatorViewModel.swift
//  March_Weekend_1_Day_2
//
//  Created by MD Tanvir Alam on 7/3/21.
//

import Foundation

class CalculatorViewModel:ObservableObject{
    @Published var calculatorScreen = ""
    
    func equalButtonPressed(){
        let calculationString = calculatorScreen
        calculatorScreen = ""
        var operators = [String]()
        var numbers = [String]()
        
        numbers = matches(for: "[1-9]\\d*(\\.\\d+)?", in: calculationString)
        operators = matches(for: "[+\\-*/]", in: calculationString)
        
        print(numbers)
        print(operators)
        
        while operators.firstIndex(of: "/") != nil {
            if let indexOfDivision = operators.firstIndex(of: "/"){
                let result = Double(numbers[indexOfDivision])! / Double(numbers[indexOfDivision + 1])!
                print(result)
                operators.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.insert(String(result), at: indexOfDivision)
                calculatorScreen = String(result)
            }
        }
        
        while operators.firstIndex(of: "*") != nil {
            if let indexOfDivision = operators.firstIndex(of: "*"){
                let result = Double(numbers[indexOfDivision])! * Double(numbers[indexOfDivision + 1])!
                print(result)
                operators.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.insert(String(result), at: indexOfDivision)
                calculatorScreen = String(result)
            }
        }
        
        while operators.firstIndex(of: "+") != nil {
            if let indexOfDivision = operators.firstIndex(of: "+"){
                let result = Double(numbers[indexOfDivision])! + Double(numbers[indexOfDivision + 1])!
                print(result)
                operators.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.insert(String(result), at: indexOfDivision)
                calculatorScreen = String(result)
            }
        }
        while operators.firstIndex(of: "-") != nil {
            if let indexOfDivision = operators.firstIndex(of: "-"){
                let result = Double(numbers[indexOfDivision])! - Double(numbers[indexOfDivision + 1])!
                print(result)
                operators.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.remove(at: indexOfDivision)
                numbers.insert(String(result), at: indexOfDivision)
                calculatorScreen = String(result)
            }
        }
    }
    
    func matches(for regex: String, in text: String) -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    func cButtoPressed(){
        if calculatorScreen.isEmpty{
            
        }else{
            calculatorScreen.removeLast()
        }
        
    }
    
}
