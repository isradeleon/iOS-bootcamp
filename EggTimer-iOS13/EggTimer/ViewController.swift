//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        switch hardness {
        case "Soft": print("Cook for \(softTime) minutes.")
        case "Medium": print("Cook for \(mediumTime) minutes.")
        case "Hard": print("Cook for \(hardTime) minutes.")
        default: print("No valid hardness provided.")
        }
    }
}
