//
//  ViewController.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 25/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let startView = StartView()
    let mathUI = MathUI()
    let historyUI = HistoryUI()
    
    var quizManager = QuizManager()
    var selectedView: AppUI?
    
    override func loadView() {
        super.loadView()
        self.view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startView.firstButton.addTarget(self, action: #selector(topicSelected), for: .touchUpInside)
        startView.secondButton.addTarget(self, action: #selector(topicSelected), for: .touchUpInside)
    }
    
    // topic selected, show view with selected topic
    @objc func topicSelected(_ sender: UIButton) {
        if sender.currentTitle == "Math" {
            quizManager.selectedQuiz = quizManager.quizMath
            selectedView = mathUI
            view = selectedView
            selectedView!.firstButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            selectedView!.secondButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            updateUI()
        } else {
            quizManager.selectedQuiz = quizManager.quizHistory
            selectedView = historyUI
            view = selectedView
            selectedView!.firstButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            selectedView!.secondButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            selectedView!.thirdButton.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
            updateUI()
        }
    }
    
    @objc func answerButtonTapped(_ sender: UIButton!){
        
        let userAnswer = sender.currentTitle!
        sender.backgroundColor = quizManager.checkAnswer(userAnswer)
        
        if quizManager.nextQuestion() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: updateUI)
        } else {
            // show the score result
            selectedView!.progressBar.progress += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.selectedView!.firstButton.alpha = 0
                self.selectedView!.secondButton.alpha = 0
                self.selectedView!.thirdButton.alpha = 0
                self.selectedView!.progressBar.alpha = 0
                self.selectedView!.questionLabel.text = "Score: \(self.quizManager.score)"
                self.selectedView!.scoreLabel.alpha = 0
            }
            // reset values and show start view
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: resetQuiz)
        }
    }
    
    func setButtonsTitles() {
        if selectedView! == mathUI {
            selectedView!.firstButton.setTitle("True", for: .normal)
            selectedView!.secondButton.setTitle("False", for: .normal)
        } else {
            let buttonsArray = [selectedView!.firstButton, selectedView!.secondButton, selectedView!.thirdButton]
            
            let correctAnswer = quizManager.historyAnswers[quizManager.questionNumber].correct
            let wrongA = quizManager.historyAnswers[quizManager.questionNumber].wrongA
            let wrongB = quizManager.historyAnswers[quizManager.questionNumber].wrongB
            
            var answersArray = [correctAnswer, wrongA, wrongB]
            
            // set title for buttons of answers options random
            for buttons in buttonsArray {
                let randomTitle = answersArray.randomElement()
                buttons.setTitle(randomTitle, for: .normal)
                if let index = answersArray.firstIndex(of: randomTitle!) {
                    answersArray.remove(at: index)
                }
            }
        }
    }
    
    func updateUI(){
        setButtonsTitles()
        selectedView!.firstButton.backgroundColor = .clear
        selectedView!.secondButton.backgroundColor = .clear
        selectedView!.thirdButton.backgroundColor = .clear
        selectedView!.scoreLabel.alpha = 1
        selectedView!.firstButton.alpha = 1
        selectedView!.thirdButton.alpha = 1
        selectedView!.secondButton.alpha = 1
        selectedView!.progressBar.alpha = 1
        selectedView!.scoreLabel.text = "Score: \(quizManager.score)"
        selectedView!.questionLabel.text = quizManager.getQuestion()
        selectedView!.progressBar.progress = quizManager.getProgress()
    }
    
    func resetQuiz() {
        quizManager.questionNumber = 0
        quizManager.score = 0
        view = startView
    }
}
