//
//  Question.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 29/01/2023.
//

import Foundation

struct Question {
    let text: String
    let answer: String
}


struct HistoryAnswers {
    let correct: String
    let wrongA: String
    let wrongB: String
}

struct QuizTopic {
    
    let math: [Question]
    let history: [Question]
}
