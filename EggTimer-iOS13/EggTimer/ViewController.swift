//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    let boiledEggTimes: [ String : Int ] = [ "Soft": 5*60, "Medium": 7*60, "Hard": 12*60 ]
    var timer: Timer?
    
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        self.countdownLabel.text = "Begin cooking..."
        timer?.invalidate()
        
        let hardness = sender.currentTitle!
        var eggCountdown = boiledEggTimes[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.countdownLabel.text = "\(eggCountdown) seconds left..."
            eggCountdown -= 1
            if eggCountdown == 0 {
                timer.invalidate()
            }
        }
    }
}
