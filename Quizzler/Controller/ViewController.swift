//
//  ViewController.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 25/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let userInterface = UserInterface()
    let quiz = [
        Question(text: "4 + 2 = 6", answer: "True"),
        Question(text: "5 - 3 > 1", answer: "True"),
        Question(text: "3 + 8 < 10", answer: "False")
    ]
    
    var questionNumber = 0
    var score = 0
    
    override func loadView() {
        super.loadView()
        self.view = userInterface
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        userInterface.trueButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        userInterface.falseButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
    }
    
    @objc func answerButtonTapped(_ sender: UIButton!){
        
        let userAnswer = sender.currentTitle!
        let correctAnswer = quiz[questionNumber].answer
        if userAnswer == correctAnswer {
            score += 1
        }
    
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            updateUI()
        } else {
            // show the score result
            userInterface.questionLabel.text = "Score: \(score)"
            userInterface.scoreLabel.alpha = 0
            
            // reset the interface
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.questionNumber = 0
                self.score = 0
                self.updateUI()
            }
        }
    }
    
    func updateUI(){
        userInterface.scoreLabel.alpha = 1
        userInterface.scoreLabel.text = "Score: \(score)"
        userInterface.questionLabel.text = quiz[questionNumber].text
    }
}

