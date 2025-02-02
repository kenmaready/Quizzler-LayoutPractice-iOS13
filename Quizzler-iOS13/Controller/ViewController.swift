//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreView: UILabel!
    @IBOutlet weak var questionTextView: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    var answerButtons: [UIButton]?
    
    var player: AVAudioPlayer?
    var timer: Timer?
    var quiz = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerButtons = [answerOneButton, answerTwoButton, answerThreeButton]
        updateUI()
    }

    @IBAction func userAnswerSubmitted(_ sender: UIButton) {

        let userAnswer = sender.tag
        if quiz.submitAnswer(userAnswer) {
            playSound(name: "correct-sound")
            changeButtonColor(sender: sender, correct: true)
        } else {
            playSound(name: "incorrect-sound")
            changeButtonColor(sender: sender, correct: false)
        }
        updateUI()
    }
    
    func updateUI() {
        displayScore()
        loadCurrentQuestion()
        loadCurrentAnswers()
        updateProgressBar()
    }
    
    func displayScore() {
        var scoreText = String(quiz.score)
        if quiz.score < 10 { scoreText = "0" + scoreText }
        scoreView.text = scoreText
    }
    
    func loadCurrentQuestion() {
        questionTextView.text = quiz.currentQuestion()
    }
    
    func loadCurrentAnswers() {
        let answers = quiz.currentAnswerOptions()
        for i in 0...2 {
            answerButtons?[i].setTitle(answers[i], for: .normal)
        }
    }
    
    func updateProgressBar() {
        progressBarView.progress = quiz.currentProgress()
    }
    
    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    func changeButtonColor(sender: UIButton, correct: Bool) {
        if correct { sender.backgroundColor = UIColor.systemGreen }
        else { sender.backgroundColor = UIColor.systemRed }
        timer = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) {_ in
            sender.backgroundColor = UIColor.clear
            self.timer?.invalidate()
            }
    }
    
}

