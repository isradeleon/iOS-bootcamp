//
//  BodyMassIndexCalculator.swift
//  BMI Calculator
//
//  Created by Israel Diaz de Leon on 26/02/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import Foundation

struct BodyMassIndexCalculator {
    private var bmi: Float?
    
    mutating func calculate(
        height: Float, weight: Float
    ) {
        bmi = weight / pow(height, 2)
    }
    
    func getBMIResult() -> String {
        return String(format: "%.1f", bmi ?? 0)
    }
}
