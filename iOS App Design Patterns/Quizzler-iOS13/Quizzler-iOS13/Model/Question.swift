//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Israel Diaz de Leon on 23/02/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
