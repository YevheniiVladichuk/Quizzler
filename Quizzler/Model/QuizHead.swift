//
//  QuizHead.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 30/01/2023.
//

import Foundation
import UIKit

struct QuizHead {
    
    let quiz = [
        Question(text: "4 + 2 = 6", answer: "True"),
        Question(text: "5 - 3 > 1", answer: "True"),
        Question(text: "3 + 8 < 10", answer: "False")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String)-> UIColor {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
}
