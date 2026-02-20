//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let boiledEggTimes = [ "Soft": 5, "Medium": 7, "Hard": 12 ]
    
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if let time = boiledEggTimes[hardness] {
            print("Cook the eggs for \(time) minutes")
        } else {
            print("Error with specified egg hardness.")
        }
    }
}
