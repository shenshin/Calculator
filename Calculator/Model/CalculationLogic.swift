//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Ales Shenshin on 30/12/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic {
    
    private var number: Double?
    
    private var inermediteCalculation: (number1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    private func performTwoNumCalculation(number2: Double)->Double?{
        if let number1 = inermediteCalculation?.number1, let operation = inermediteCalculation?.calcMethod {
            switch operation {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "÷":
                return number1 / number2
            case "×":
                return number1 * number2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
    
    mutating func calculate(symbol: String)->Double?{

        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(number2: n)
            default:
                inermediteCalculation = (number1: n, calcMethod: symbol)
                return n
            }
        } else {
            return nil
        }
    }
}
