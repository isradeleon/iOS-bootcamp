//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Israel Diaz de Leon on 26/02/26.
//  Copyright © 2026 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiResult: String?
    var bmiAdvice: String?
    var bmiBgColor: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showBMIResults()
    }
    
    func showBMIResults() {
        bmiLabel.text = bmiResult
        adviceLabel.text = bmiAdvice
        view.backgroundColor = bmiBgColor
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
