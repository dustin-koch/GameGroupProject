//
//  QuestionController.swift
//  TeamGame
//
//  Created by Dustin Koch on 6/12/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

class QuestionController {
    
    //MARK: - Singleton
    static let sharedInstance = QuestionController()
    private init() {}
    
    //MARK: - Properties
    var questionSet: [SpecificQuestion]?
    let questionURL = "https://opentdb.com/api.php?amount=10&type=multiple"
    
    //MARK: - CRUD Functions
    func fetchAllQuestions(completion: @escaping ([SpecificQuestion]?) -> Void) {
        guard let url = URL(string: questionURL) else { completion(nil); return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return }
            let jsonDecoder = JSONDecoder()
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelJSONDictionary.self, from: data)
                let questions = topLevelDictionary.results
                self.questionSet = questions
                completion(questions)
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
        }.resume()
    }
}//END OF CLASS

extension QuestionController {
    func makeQuestionsArray(question: SpecificQuestion) -> [String] {
        var array: [String] = []
        array.append(question.correctAnswer)
        for question in question.incorrectAnswers {
            array.append(question)
        }
        return array.shuffled()
    }
}
