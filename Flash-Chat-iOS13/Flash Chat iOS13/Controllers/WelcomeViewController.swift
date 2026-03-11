//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTitleLabel(title: "⚡️FlashChat")
    }
    
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
