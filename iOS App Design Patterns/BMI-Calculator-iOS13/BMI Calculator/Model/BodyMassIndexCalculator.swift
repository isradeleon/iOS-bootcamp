//
//  BodyMassIndexCalculator.swift
//  BMI Calculator
//
//  Created by Israel Diaz de Leon on 26/02/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit

struct BodyMassIndexCalculator {
    private var bmi: BMI?
    
    mutating func calculate(
        height: Float, weight: Float
    ) {
        let bmiResult = weight / pow(height, 2)
        
        switch bmiResult {
            case ..<18.5: bmi = BMI(
                value: bmiResult,
                advice: "Eat more nutritious food!",
                color: .systemYellow
            )
            case 18.5...24.9: bmi = BMI(
                value: bmiResult,
                advice: "Perfect! Your weight is on point.",
                color: .systemGreen
            )
            default: bmi = BMI(
                value: bmiResult,
                advice: "Eat less sugar & get to the Gym!",
                color: .systemRed
            )
        }
    }
    
    func getBMIResult() -> String {
        return String(format: "%.1f", bmi?.value ?? 0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No se detectaron resultados."
    }
    
    func getBMIColorIndicator() -> UIColor {
        return bmi?.color ?? .systemBlue
    }
}
