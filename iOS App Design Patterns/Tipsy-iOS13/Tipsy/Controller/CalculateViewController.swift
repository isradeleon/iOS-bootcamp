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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRootViewTapGesture()
        setupDefaultCalculatorValues()
    }
    
    func setupDefaultCalculatorValues(){
        splitBillCalculator.setNumberOfPeople(2)
        splitBillCalculator.setTipPercentage(10)
    }
    
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
        let peopleCount = Int(sender.value)
        splitCountLabel.text = String(peopleCount)
        splitBillCalculator.setNumberOfPeople(peopleCount)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? "0"
        if let total = Float(bill) {
            splitBillCalculator.setTotal(total)
            splitBillCalculator.calculateTotalPerPerson()
            self.performSegue(withIdentifier: "calculator_to_results", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculator_to_results" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.totalPerPerson = splitBillCalculator.getTotalPerPerson()
            resultVC.details = splitBillCalculator.getBillDetails()
        }
    }
    
    func setupRootViewTapGesture() {
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rootViewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func rootViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

