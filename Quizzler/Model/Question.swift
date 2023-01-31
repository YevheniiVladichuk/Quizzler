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

struct QuestionHistory {
    let text: String
    let correctAnswer: String
    let firstWrong: String
    let secondWrong: String
}
