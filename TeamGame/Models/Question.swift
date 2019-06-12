//
//  Question.swift
//  TeamGame
//
//  Created by Dustin Koch on 6/12/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

struct TopLevelJSONDictionary: Codable {
    let results: [SpecificQuestion]
}

struct SpecificQuestion: Codable {
    let category: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category
        case difficulty
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
