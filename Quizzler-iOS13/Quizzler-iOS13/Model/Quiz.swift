//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by Israel Diaz de Leon on 24/02/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

struct Quiz {
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    private var currentQuestionIndex = 0
    private var rightAnswers = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let result = userAnswer == questions[currentQuestionIndex].correctAnswer
        if result { rightAnswers += 1 }
        return result
    }
    
    func getProgress() -> Float {
        return Float(currentQuestionIndex+1) * 100.0 / Float(questions.count) * 0.01
    }
    
    func getScore() -> Int {
        return rightAnswers
    }
    
    func getCurrentQuestion() -> Question {
        return questions[currentQuestionIndex]
    }
    
    // We have to explicitly mark the method as mutating when dealing with STRUCTS
    mutating func nextQuestion() {
        // Here we cycle through the quiz questions list
        if currentQuestionIndex < questions.count-1 {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0
            rightAnswers = 0
        }
    }
}
