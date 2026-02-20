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
    @IBOutlet weak var progressView: UIProgressView!
    
    let boiledEggTimes: [ String : Int ] = [ "Soft": 5*60, "Medium": 7*60, "Hard": 12*60 ]
    var timer: Timer?
    
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        self.countdownLabel.text = "Begin cooking..."
        timer?.invalidate()
        
        let hardness = sender.currentTitle!
        let cookingTime = boiledEggTimes[hardness]!
        var eggCountdown = cookingTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.countdownLabel.text = "\(eggCountdown) seconds left..."
            self.progressView.progress = self.calculateProgress(
                totalTime: cookingTime,
                countDown: eggCountdown
            )
        
            eggCountdown -= 1
            if eggCountdown == 0 {
                timer.invalidate()
                self.countdownLabel.text = "Done!"
            }
        }
    }
    
    func calculateProgress(
        totalTime: Int,
        countDown: Int
    ) -> Float {
        let elapsedTime = totalTime - countDown
        let percentage = Float(elapsedTime * 100 / totalTime)
        return percentage * 0.01
    }
}
