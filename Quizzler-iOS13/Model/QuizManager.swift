//
//  QuizManager.swift
//  Quizzler-iOS13
//
//  Created by Ken Maready on 6/26/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizManager {
    // properties
    let questions = [
        QuizQuestion(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: 1),
                QuizQuestion(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: 2),
                QuizQuestion(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: 1),
                QuizQuestion(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: 0),
                QuizQuestion(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: 2),
                QuizQuestion(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: 1),
                QuizQuestion(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: 1),
                QuizQuestion(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: 0),
                QuizQuestion(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: 1),
                QuizQuestion(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: 1)
    ]
    var currentQuizItem = 0
    var score = 0
    
    // getters
    func currentQuestion() -> String {
        return questions[currentQuizItem].q
    }
    
    func currentAnswerOptions() -> [String] {
        return questions[currentQuizItem].a
    }
    
    func currentCorrectAnswer() -> String {
        return questions[currentQuizItem].a[questions[currentQuizItem].correctAnswer]
    }
    
    func currentProgress() -> Float {
        Float(currentQuizItem + 1)/Float(questions.count)
    }
    
    // other methods
    mutating func submitAnswer(_ userAnswer: Int) -> Bool {
        if userAnswer == questions[currentQuizItem].correctAnswer {
            advance()
            score += 1
            return true
        }
        advance()
        return false
    }
    
    mutating func advance() {
        currentQuizItem += 1;
        if currentQuizItem >= questions.count {
            currentQuizItem = 0;
        }
    }
} // QuizManaager
