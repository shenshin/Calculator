//
//  ViewController.swift
//  Calculator
//
//  Created by Ales Shenshin on 29/12/2018.
//  Copyright © 2018 Shenshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber : Bool = true
    
 
    //var number: Number = Number()
//    var titleString : String = "0"
//    var number : Int {
//        get {
//            if let number = Int(titleString) {
//                return number
//            } else {
//                return 0
//            }
//        }
//    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        displayLabel.text = titleString
//    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Can not convert display label to a double")
        }
        print(number)
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayLabel.text = String(number / 100)
            default:
                return
                //displayLabel.text = String(number)
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." && displayLabel.text!.contains("."){
                    return
                }
                guard Double(displayLabel.text!) != nil else {
                    fatalError("Cannot conver display label to a double")
                }
                displayLabel.text! += numValue
            }
        }
    }
}

