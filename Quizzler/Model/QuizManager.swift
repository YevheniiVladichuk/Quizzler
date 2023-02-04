//
//  QuizHead.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 30/01/2023.
//

import Foundation
import UIKit

struct QuizManager {
    
    let quizMath = [
        Question(text: "4 + 2 = 6", answer: "True"),
        Question(text: "5 - 3 > 1", answer: "True"),
        Question(text: "3 + 8 < 10", answer: "False"),
        Question(text: "22 - 15 > 23 - 5", answer: "False"),
        Question(text: "2 + 7 - 9 = 1", answer: "False")
    ]
    
    let quizHistory = [
        Question(text: "Where did the Olympic Games originate?", answer: "Greece"),
        Question(text: "What is the name of the most famous pyramids?", answer: "The Great Pyramids of Giza"),
        Question(text: "Who was the first American President?", answer: "George Washington")
    ]
    
    let historyAnswers = [
        HistoryAnswers(correct: "Greece", wrongA: "Atlantida", wrongB: "Italy"),
        HistoryAnswers(correct: "The Great Pyramids of Giza", wrongA: "The Great Pyramids of Sparta", wrongB: "Mesoamerican pyramids"),
        HistoryAnswers(correct: "George Washington", wrongA: "Will Smith", wrongB: "Benjamin Franklin")
    ]
    
    
    var selectedQuiz: [Question]?
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String)-> UIColor {
        if userAnswer == selectedQuiz![questionNumber].answer {
            score += 1
            return UIColor.green
        } else {
            return UIColor.red
        }
    }
    
    func getQuestion() -> String {
        return selectedQuiz![questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(selectedQuiz!.count)
    }
    
    mutating func nextQuestion()-> Bool {
        if questionNumber + 1 < selectedQuiz!.count {
            questionNumber += 1
            return true
        } else {
            return false
        }
    }
}
