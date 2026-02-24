//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
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
        questionLabel.text = quiz.getCurrentQuestion().text
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore()) / \(quiz.questions.count)"
        
        trueBtn.backgroundColor = UIColor.clear
        falseBtn.backgroundColor = UIColor.clear
    }
}

