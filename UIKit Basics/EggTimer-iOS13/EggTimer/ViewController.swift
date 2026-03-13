//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let boiledEggTimes: [ String : Int ] = [ "Soft": 10, "Medium": 7*60, "Hard": 12*60 ]
    var timer: Timer?
    var player: AVAudioPlayer?
    
    @IBAction func eggBtnPressed(_ sender: UIButton) {
        restartCookingProcess()
        
        let hardness = sender.currentTitle!
        let cookingTime = boiledEggTimes[hardness]!
        var eggCountdown = cookingTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.progressView.progress = self.calculateProgress(
                totalTime: cookingTime,
                countDown: eggCountdown
            )
            
            if eggCountdown == 0 {
                timer.invalidate()
                self.countdownLabel.text = "Done!"
                self.playSound()
            } else {
                self.countdownLabel.text = "\(eggCountdown) seconds left..."
            }
        
            eggCountdown -= 1
        }
    }
    
    func restartCookingProcess() {
        timer?.invalidate()
        self.countdownLabel.text = "Begin cooking..."
        self.progressView.progress = 0
    }
    
    func calculateProgress(
        totalTime: Int,
        countDown: Int
    ) -> Float {
        let elapsedTime = totalTime - countDown
        let percentage = Float(elapsedTime * 100 / totalTime)
        return percentage * 0.01
    }
    
    func playSound() {
        guard let url = Bundle.main.url(
            forResource: "alarm_sound", withExtension: "mp3"
        ) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
