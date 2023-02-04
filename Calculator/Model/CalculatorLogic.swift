//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Marina Karpova on 04.02.2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var displayValue: Double?
    var storedValue: String?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.displayValue = number
    }
    
    mutating func calcMethod(on sender: String) -> Double? {
        
        if let n = displayValue {
            switch sender {
            case "+/-" :
                return n * -1
            case "AC" :
                storedValue = ""
                return 0
            case "%" :
                storedValue = ""
                return n * 0.01
            case "=" :
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: sender)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("no one cases")
            }
        }
        return nil
    }
}
