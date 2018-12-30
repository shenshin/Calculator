//
//  ViewController.swift
//  Calculator
//
//  Created by Ales Shenshin on 29/12/2018.
//  Copyright © 2018 Shenshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Флаг окончания ввода текста
    private var isFinishedTypingNumber : Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //Установка флага окончания ввода текста
        isFinishedTypingNumber = true
        
        //Параноидальная проверка возможности преобразования текста на дисплее в адекватное число
        guard let number = Double(displayLabel.text!) else {
            fatalError("Can not convert display label to a double")
        }
        
        print(number)
        
        //Нажатие на один из трех унарных операторов
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "+/-":
                if number.rounded(.down) == number {
                    displayLabel.text = String(Int(number) * -1)
                } else {
                    displayLabel.text = String(number * -1)
                }
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayLabel.text = String(number / 100)
            default:
                return
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                //Если при начале ввода текста нажата точка, то перед ней вставляется 0
                if numValue == "." {
                    displayLabel.text = "0."
                }
                    //Если при начале ввода цифр происходит нажатие на 0, то дисплей обнуляется и выпонение метода завершается
                else if numValue == "0" {
                    displayLabel.text = "0"
                    return
                }
                    //Ввод первой цифры
                else {
                    displayLabel.text = numValue
                }
                //Сброс флага окончания ввода текста
                isFinishedTypingNumber = false
            } else {
                //Ввод последующих цифр при выключенном флаге окончания ввода текста
                
                //В случае если при нажатии на точку в тексте на дисплее уже есть точка, то выполнение метода завершается
                if numValue == "." && displayLabel.text!.contains("."){
                    return
                }
                //Параноидальная проверка возможности преобразования текста на дисплее в адекватное число
                guard Double(displayLabel.text!) != nil else {
                    fatalError("Cannot conver display label to a double")
                }
                displayLabel.text! += numValue
            }
        }
    }
}

