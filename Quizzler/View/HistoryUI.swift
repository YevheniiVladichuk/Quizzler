//
//  HistoryUI.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 31/01/2023.
//

import Foundation
import UIKit

class HistoryUI: MathUI {
    
//    var quizManager = QuizManager()
//    
//    lazy var buttonsArray = [firstButton, secondButton, thirdButton]
//    
//    lazy var correctAnswer = quizManager.historyAnswers[quizManager.questionNumber].correct
//    lazy var wrongA = quizManager.historyAnswers[quizManager.questionNumber].wrongA
//    lazy var wrongB = quizManager.historyAnswers[quizManager.questionNumber].wrongB
//    
//    lazy var buttonsTitlesArray = [correctAnswer, wrongA, wrongB]
//    
//    // set title for buttons of answers options random
//        override func namedButtons() {
//            for buttons in buttonsArray {
//                let randomTitle = buttonsTitlesArray.randomElement()
//                buttons.setTitle(randomTitle, for: .normal)
//                if let index = buttonsTitlesArray.firstIndex(of: randomTitle!) {
//                    buttonsTitlesArray.remove(at: index)
//                }
//            }
//        }
    
    override func addSubviewsWithConstraints() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(scoreLabel)
        verticalStackView.addArrangedSubview(questionLabel)
        verticalStackView.addArrangedSubview(firstButton)
        verticalStackView.addArrangedSubview(secondButton)
        verticalStackView.addArrangedSubview(thirdButton)
        verticalStackView.addArrangedSubview(progressBar)
        // constaraints
        NSLayoutConstraint.activate([
            
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            scoreLabel.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 0),
            scoreLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 20),
            
            questionLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            firstButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            firstButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            secondButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            secondButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            thirdButton.heightAnchor.constraint(equalToConstant: 80),
            thirdButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            thirdButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
        ])
    }
}
