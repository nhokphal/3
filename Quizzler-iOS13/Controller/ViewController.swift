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
    @IBOutlet weak var progressLabel: UIProgressView!
    @IBOutlet weak var trueLabel: UIButton!
    @IBOutlet weak var falseLabel: UIButton!
    
    @IBOutlet weak var Score: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quiz[questionNumber].text // .text is using structure
        /* basically this adding array to questionLabel, and run through the app, since this is 2D array number shoube [0][0]
                                                       to grab first col*/
        updateUI() // calling function updateUI for increase value of number array
    }

    @IBAction func keyPressLabel(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if  userAnswer == userGotItRight{
            sender.backgroundColor = UIColor.green
       }else{
           sender.backgroundColor = UIColor.red  ///use background to send back color to feedback users it wrong use Red
       }

        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
                
    }
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText.text()// using .text instead of 2day, ( convert from [0][0] to [0].text
        trueLabel.backgroundColor = UIColor.clear /// to clear background color for user, not to get stuck
        falseLabel.backgroundColor = UIColor.clear
        // range from 1 to 3 array
        progressLabel.progress = quizBrain.getProgress()
        // find progressbar use progress and number of question divide by number of quiz.
    }
    
}

