//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Pranjal Shinde on 10/04/25.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    var bmiCalculated : BMI?

    mutating func bmiValue(_ height: Float, _ weight: Float) -> Double{
        let value = Double(weight/pow(height, 2))
        
        if(value < 18.5){
            bmiCalculated = BMI(value: value, advice: "Eat more!!", colour: UIColor.cyan)
        }else if value < 24.9 {
            bmiCalculated = BMI(value: value, advice: "Fit!!", colour: UIColor.green)
        } else {
            bmiCalculated = BMI(value: value, advice: "Exercise needed!!", colour: UIColor.orange)
        }
        
        return bmiCalculated?.value ?? 0.0
    }
    
    func getAdvice() -> String {
        return bmiCalculated?.advice ?? "BMI Calculation"
    }
    
    func getColor() -> UIColor {
        return bmiCalculated?.colour ?? UIColor.white
    }
    
    
}
