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
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refreshQuestionUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let result = quiz.checkAnswer(userAnswer)
        
        if result {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        // Here we cycle through the quiz questions
        if currentQuestion < quiz.count-1 {
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.refreshQuestionUI()
        }
    }

    func refreshQuestionUI() {
        questionLabel.text = quiz[currentQuestion].text
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
        progressBar.progress = calculatePercentage()
    }
    
    func calculatePercentage() -> Float {
        return Float(currentQuestion+1) * 100.0 / Float(quiz.count) * 0.01
    }
}

