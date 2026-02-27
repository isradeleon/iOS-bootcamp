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
    
    mutating func setTip(_ tip: Float) {
        self.tip = tip
    }
    
    mutating func setTotal(_ total: Float) {
        self.total = total
    }
    
    mutating func setNumberOfPeople(_ count: Int) {
        self.people = Float(count)
    }
}
