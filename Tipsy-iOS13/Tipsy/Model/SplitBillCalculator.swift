//
//  Calculator.swift
//  Tipsy
//
//  Created by Israel Diaz de Leon on 27/02/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

struct SplitBillCalculator {
    private var tip: Float?
    private var total: Float?
    private var people: Float?
    private var totalPerPerson: Float?
    
    mutating func setTipPercentage(_ tip: Float) {
        self.tip = tip * 0.01
    }
    
    mutating func setTotal(_ total: Float) {
        self.total = total
    }
    
    mutating func setNumberOfPeople(_ count: Int) {
        self.people = Float(count)
    }
    
    mutating func calculateTotalPerPerson() {
        if let tip = self.tip, let total = self.total, let people = self.people {
            // Now all optionals are safe within this scope:
            let actualTip = total * tip
            let totalWithTip = total + actualTip
            totalPerPerson = totalWithTip / people
        }
    }
}
