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
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: updateUI)
        } else {
            // show the score result
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.userInterface.trueButton.alpha = 0
                self.userInterface.falseButton.alpha = 0
                self.userInterface.progressBar.alpha = 0
                self.userInterface.questionLabel.text = "Score: \(self.score)"
                self.userInterface.scoreLabel.alpha = 0
                
            }
            // reset values
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.questionNumber = 0
                self.score = 0
                self.updateUI()
            }
        }
    }
    
    func updateUI(){
        userInterface.trueButton.backgroundColor = .clear
        userInterface.falseButton.backgroundColor = .clear
        userInterface.scoreLabel.alpha = 1
        userInterface.trueButton.alpha = 1
        userInterface.falseButton.alpha = 1
        userInterface.progressBar.alpha = 1
        userInterface.scoreLabel.text = "Score: \(score)"
        userInterface.questionLabel.text = quiz[questionNumber].text
    }
}
