//
//  BMIViewController.swift
//  BMI Calculator
//
//  Created by Israel Diaz de Leon on 26/02/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit

class BMIViewController: UIViewController {
    
    var bmiValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        appendUILabel()
    }
    
    func appendUILabel() {
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 10, y: 10, width: 200, height: 50)
        view.addSubview(label)
    }
}
