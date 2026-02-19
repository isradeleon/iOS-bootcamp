//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.removeAllAnimations()
        playSound(note: sender.currentTitle)
        animatePressedKey(sender: sender)
    }
    
    func animatePressedKey(sender: UIButton) {
        sender.alpha = 0.5
        fadeIn(target: sender)
    }
    
    func fadeIn(target: UIView) {
        UIButton.animate(withDuration: 0.2) { target.alpha = 1 }
    }
 
    func playSound(note: String?) {
        guard let url = Bundle.main.url(
            forResource: note, withExtension: "wav"
        ) else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            if (player != nil) {
                player.play()
            }

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

