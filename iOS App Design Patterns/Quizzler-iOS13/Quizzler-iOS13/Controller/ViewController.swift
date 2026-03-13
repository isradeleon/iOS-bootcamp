//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Quiz indicators
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Answer buttons
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    
    // var keyword allows the STRUCT and its PROPERTIES to be mutable
    var quiz = Quiz()
    
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
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.quiz.nextQuestion()
            self.refreshQuestionUI()
        }
    }

    func refreshQuestionUI() {
        let currentQuestion = quiz.getCurrentQuestion()
        questionLabel.text = currentQuestion.text
        
        // Show answer options
        firstBtn.setTitle(currentQuestion.answers[0], for: .normal)
        secondBtn.setTitle(currentQuestion.answers[1], for: .normal)
        thirdBtn.setTitle(currentQuestion.answers[2], for: .normal)
        
        // Update progress indicators
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore()) / \(quiz.questions.count)"
        
        // Reset btn colors
        firstBtn.backgroundColor = UIColor.clear
        secondBtn.backgroundColor = UIColor.clear
        thirdBtn.backgroundColor = UIColor.clear
    }
}

