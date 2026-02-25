//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderValueChange(_ sender: UISlider) {
        switch sender.accessibilityIdentifier {
            case "heightSlider": heightLabel.text = String(sender.value)
            case "weightSlider": weightLabel.text = String(sender.value)
            default: print("Slider not found")
        }
    }
    
}

