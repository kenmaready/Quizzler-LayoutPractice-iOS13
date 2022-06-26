//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct QuizQuestion {
    let q: String
    let a: Bool
}

class ViewController: UIViewController {
    
    @IBOutlet weak var questionTextView: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions = [
        QuizQuestion(q:"A slug's blood is green.", a:true),
        QuizQuestion(q:"Approximately one quarter of human bones are in the feet.", a:true),
        QuizQuestion(q:"The total surface area of two human lungs is approximately 70 square metres.", a:true),
        QuizQuestion(q:"In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a:true),
        QuizQuestion(q:"In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a:false),
        QuizQuestion(q:"It is illegal to pee in the Ocean in Portugal.", a:true),
        QuizQuestion(q:"You can lead a cow down stairs but not up stairs.", a:false),
        QuizQuestion(q:"Google was originally called 'Backrub'.", a:true),
        QuizQuestion(q:"Buzz Aldrin's mother's maiden name was 'Moon'.", a:true),
        QuizQuestion(q:"The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a:false),
        QuizQuestion(q:"No piece of square dry paper can be folded in half more than 7 times.", a:false),
        QuizQuestion(q:"Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a:true),
    ]
    var currentQuizItem = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentQuestion()
    }

    @IBAction func userAnswerSubmitted(_ sender: UIButton) {
        let userAnswer = sender.currentTitle == "True"
        if userAnswer == questions[currentQuizItem].a {
            score += 1
            print("correct. current score is: \(score)")
        } else {
            print("incorrect. current score remains: \(score)")
        }
        currentQuizItem += 1;
        if currentQuizItem >= questions.count { currentQuizItem = 0 }
        loadCurrentQuestion()
    }
    
    func loadCurrentQuestion() {
        questionTextView.text = questions[currentQuizItem].q
    }
    
}

