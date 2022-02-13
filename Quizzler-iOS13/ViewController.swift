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
        ["Your Mom", "False"],
        ["No Questions for you bitch", "True"],
        ["BLM", "False"]
    ]
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionNumber][1]
        
        if(userAnswer == actualAnswer){
            print("Right")
        }
        else {
            print("Wrong")
        }
        
        questionNumber += 1
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = questions[questionNumber][0]
        
        
    }
    
}

