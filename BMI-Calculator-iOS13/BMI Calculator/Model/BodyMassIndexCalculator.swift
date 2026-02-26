//
//  BodyMassIndexCalculator.swift
//  BMI Calculator
//
//  Created by Israel Diaz de Leon on 26/02/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import Foundation

struct BodyMassIndexCalculator {
    private var bmi: BMI?
    
    mutating func calculate(
        height: Float, weight: Float
    ) {
        let result = weight / pow(height, 2)
        bmi = BMI(
            value: result, advice: "", color: .systemGreen
        )
        
        switch result {
        case ..<18.5: print("Underweight")
        case 18.5...24.9: print("Normal")
        default: print("Overweight")
        }
    }
    
    func getBMIResult() -> String {
        return String(format: "%.1f", bmi?.value ?? 0)
    }
}
