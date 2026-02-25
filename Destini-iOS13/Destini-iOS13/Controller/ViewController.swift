//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let stories = [
        Story(title: "You see a fork in the road", choice1: "Take a left", choice2: "Take a left"),
        Story(title: "You see a tiger", choice1: "Shout for help", choice2: "Play dead"),
        Story(title: "You find a treasure chest", choice1: "Open it", choice2: "Check for traps"),
    ]
    
    var userPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        if sender.currentTitle == stories[userPosition].choice1 {
            userPosition = 1
        } else {
            userPosition = 2
        }
        
        refreshUI()
    }
    
    func refreshUI() {
        storyLabel.text = stories[userPosition].title
        choice1Button.setTitle(stories[userPosition].choice1, for: .normal)
        choice2Button.setTitle(stories[userPosition].choice2, for: .normal)
    }
    
}

