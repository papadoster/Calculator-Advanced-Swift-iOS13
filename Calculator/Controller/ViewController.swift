//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var storedValue: String = ""
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError()
            }
            return number
        }
        set {
            let resultDouble = newValue
            let resultInt = Int(newValue)
            let resultIntToDouble = Double(resultInt)
            if resultIntToDouble == resultDouble {
                print(resultInt)
                displayLabel.text = String(resultInt)
                
            } else {
                displayLabel.text = String(resultDouble)
                print(resultDouble)
            }
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        calculator.setNumber(displayValue)
        
        if let symbol = sender.currentTitle {
            
            if let result = calculator.calcMethod(on: symbol)  {
                displayValue = result
            }
            
            storedValue = calculator.storedValue ?? ""
        }
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
            
        if (sender.currentTitle == "." && storedValue.contains(".")) {
            return
        }
        
        if (sender.currentTitle == "0" && storedValue == "0") {
            return
        }
        
        if let numValue = sender.currentTitle {
            if storedValue == "" && numValue == "." {
                storedValue = "0"
            } 
            displayLabel.text = storedValue + numValue
            storedValue.append(numValue)
            
        }
        
    }

}

