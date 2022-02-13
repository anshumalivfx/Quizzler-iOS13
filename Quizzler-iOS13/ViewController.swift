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
    
    let questions = [
        Question(text: "Your Mom", answer: "False"),
        Question(text: "No Questions for you bitch", answer: "True"),
        Question(text: "BLM", answer: "False")
    ]
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
            updateUI()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionNumber].answer
        
        if(userAnswer == actualAnswer){
            print("Right")
        }
        else {
            print("Wrong")
        }
        
        
        if questionNumber + 1 < questions.count{
            questionNumber += 1
        }
        else if questionNumber + 1 == questions.count{
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = questions[questionNumber].text
    }
    
}

