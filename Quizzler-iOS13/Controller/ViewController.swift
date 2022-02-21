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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizGame = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            updateUI()
        progressBar.progress = 0
        // Do any additional setup after loading the view.
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        var answer = quizGame.checkAnswer(userAnswer!)
        if(answer){
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        
        if quizGame.questionNumber + 1 < quizGame.questions.count{
            quizGame.questionNumber += 1
        }
        else if quizGame.questionNumber + 1 == quizGame.questions.count{
            quizGame.questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        progressBar.progress = Float(Float(quizGame.questionNumber) / Float(quizGame.questions.count))
    }
    
    @objc func updateUI(){
        questionLabel.text = quizGame.questions[quizGame.questionNumber].text
       // questionLabel.text = questions[questionNumber].text
        
        scoreLabel.text = "Score: \(quizGame.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

