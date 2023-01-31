//
//  QuizHead.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 30/01/2023.
//

import Foundation
import UIKit

struct QuizHead {
    
    
    let quizMath = [
        Question(text: "4 + 2 = 6", answer: "True"),
        Question(text: "5 - 3 > 1", answer: "True"),
        Question(text: "3 + 8 < 10", answer: "False"),
        Question(text: "22 - 15 > 23 - 5", answer: "False"),
        Question(text: "2 + 7 - 9 = 1", answer: "False")
    ]
    
    let quizHistory = [
        QuestionHistory(text: "Where did the Olympic Games originate?", correctAnswer: "Greece", firstWrong: "Italy", secondWrong: "Atlantida"),
        QuestionHistory(text: "What is the name of the most famous pyramids?", correctAnswer: "The Great Pyramids of Giza", firstWrong: "The Great Pyramids of Independents", secondWrong: "Mesoamerican pyramids"),
        QuestionHistory(text: "Who was the first American President?", correctAnswer: "George Washington.", firstWrong: "Will Smith", secondWrong: "Benjamin Franklin")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String)-> UIColor {
        if userAnswer == quizMath[questionNumber].answer {
            score += 1
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
    func getQuestion() -> String {
        return quizMath[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quizMath.count)
    }
    
    mutating func nextQuestion()-> Bool {
        if questionNumber + 1 < quizMath.count {
            questionNumber += 1
            return true
        } else {
            return false
        }
    }
}
