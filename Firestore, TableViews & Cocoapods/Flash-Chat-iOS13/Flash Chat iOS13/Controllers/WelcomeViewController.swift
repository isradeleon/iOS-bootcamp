//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCLTypingLabelText()
    }
    
    // Animating label text through a pod library
    func setupCLTypingLabelText() {
        titleLabel.text = "⚡️FlashChat"
    }
    
    // Manually animating the UILabel
    func animateTitleLabel(title: String) {
        titleLabel.text = ""
        var millisOffset = 0.1
        for character in title {
            Timer.scheduledTimer(
                withTimeInterval: millisOffset,
                repeats: false
            ) { _ in
                self.titleLabel.text?.append(character)
            }
            millisOffset += 0.1
        }
    }
}
