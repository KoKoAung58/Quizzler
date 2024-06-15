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
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var `true`: UIButton!
    @IBOutlet weak var `false`: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let answer = quizBrain.checkAnswer(userAnswer)
        
        if answer{
            sender.backgroundColor = UIColor.green
        } else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswer()
        self.true.setTitle(answers[1], for: .normal)
        self.false.setTitle(answers[2], for: .normal)
        self.thirdButton.setTitle(answers[0], for: .normal)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        self.true.backgroundColor = UIColor.clear
        self.false.backgroundColor = UIColor.clear
        self.thirdButton.backgroundColor = UIColor.clear
        progress.progress = quizBrain.getProgress()
    }
    
}

