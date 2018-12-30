//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Ales Shenshin on 30/12/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic {
    
    var number: Double
    
    init(number: Double){
        self.number = number
    }
    
    func calculate(symbol: String)->Double?{
        switch symbol {
        //Нажатие на один из трех унарных операторов
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number / 100
        default:
            return nil
        }
    }
}
