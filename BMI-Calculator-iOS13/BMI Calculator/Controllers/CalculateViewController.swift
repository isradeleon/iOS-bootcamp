//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChange(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmi = weight / pow(height, 2)
        
        // Calling the performSegue method for navigation
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        // Manually creating a VC
        /* let bmiVC = BMIViewController()
        bmiVC.bmiValue = String(format: "Your BMI: %.1f", bmi)
        self.present(bmiVC, animated: true) */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToResults":
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiResult = String(format: "%.1f", bmi)
        default:
            print("Navigation error: Segue ID not found.")
        }
    }
}

