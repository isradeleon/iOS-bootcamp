//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var splitBillCalculator = SplitBillCalculator()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitCountLabel: UILabel!
    
    @IBOutlet weak var tipBtn0: UIButton!
    @IBOutlet weak var tipBtn10: UIButton!
    @IBOutlet weak var tipBtn20: UIButton!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        unselectAllTipBtns()
        sender.isSelected = true
        
        switch sender {
        case tipBtn0: splitBillCalculator.setTipPercentage(0)
        case tipBtn10: splitBillCalculator.setTipPercentage(10)
        case tipBtn20: splitBillCalculator.setTipPercentage(20)
        default: print("Tip selection error: Unknown button pressed.")
        }
    }
    
    func unselectAllTipBtns() {
        tipBtn0.isSelected = false
        tipBtn10.isSelected = false
        tipBtn20.isSelected = false
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
    }
}

