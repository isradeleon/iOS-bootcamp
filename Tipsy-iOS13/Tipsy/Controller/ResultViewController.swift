//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Israel Diaz de Leon on 27/02/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var totalPerPerson: String?
    var details: String?
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderUIValues()
    }
    
    func renderUIValues() {
        totalPerPersonLabel.text = totalPerPerson
        detailsLabel.text = details
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
