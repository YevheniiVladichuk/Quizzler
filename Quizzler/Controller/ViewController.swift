//
//  ViewController.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 25/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let userInterface = UserInterface()
    let startView = StartView()
    var quizHead = QuizHead()
    
    override func loadView() {
        super.loadView()
        self.view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startView.trueButton.addTarget(self, action: #selector(choosedQuiz), for: .touchUpInside)
        startView.falseButton.addTarget(self, action: #selector(choosedQuiz), for: .touchUpInside)
        
        userInterface.trueButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        userInterface.falseButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
    }
    
    @objc func choosedQuiz(_ sender: UIButton) {
        
    }
    
    @objc func answerButtonTapped(_ sender: UIButton!){
        
        let userAnswer = sender.currentTitle!
        sender.backgroundColor = quizHead.checkAnswer(userAnswer)
        
        if quizHead.nextQuestion() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: updateUI)
        } else {
            // show the score result
            userInterface.progressBar.progress += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.userInterface.trueButton.alpha = 0
                self.userInterface.falseButton.alpha = 0
                self.userInterface.progressBar.alpha = 0
                self.userInterface.questionLabel.text = "Score: \(self.quizHead.score)"
                self.userInterface.scoreLabel.alpha = 0
            }
            // reset values
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.quizHead.questionNumber = 0
                self.quizHead.score = 0
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
        userInterface.scoreLabel.text = "Score: \(quizHead.score)"
        userInterface.questionLabel.text = quizHead.getQuestion()
        userInterface.progressBar.progress = quizHead.getProgress()
    }
}
