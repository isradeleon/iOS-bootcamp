//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    var currentQuestion = 0
    let quiz = [
        [ "Four + Two is equal to Six.", "True" ],
        [ "Five - Three is greater than One.", "False" ],
        [ "Three + Eight is less than Ten.", "False" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refreshQuestionUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let correctAnswer = quiz[currentQuestion][1]
        
        if userAnswer == correctAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if currentQuestion < quiz.count-1 {
            currentQuestion += 1
            refreshQuestionUI()
        }
    }

    func refreshQuestionUI() {
        questionLabel.text = quiz[currentQuestion][0]
    }
}

