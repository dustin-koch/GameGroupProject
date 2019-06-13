//
//  SplashViewController.swift
//  TeamGame
//
//  Created by winston salcedo on 6/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    //MARK: - Outlets
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func startGameTapped(_ sender: UIButton) {
        QuestionController.sharedInstance.fetchAllQuestions { (questions) in
            guard let questions = questions else { return }
            QuestionController.sharedInstance.questionSet = questions
            print(questions)
        }
        presentSimpleInputAlert(title: "Let's play trivia!", message: "Enter your name, below, to get started.")
    }
    

}//END OF CLASS

extension SplashViewController {
    func presentSimpleInputAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let startGameWithNameAction = UIAlertAction(title: "Start Game", style: .default) { (_) in
            guard let name = alertController.textFields?[0].text,
                !name.isEmpty else { return }
            QuestionController.sharedInstance.userName = name
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let nextViewController = storyBoard.instantiateViewController(withIdentifier: "questionView") as? QuestionViewController else { return }
            self.present(nextViewController, animated: true)
        }
        alertController.addAction(dismissAction)
        alertController.addAction(startGameWithNameAction)
        self.present(alertController, animated: true)
    }
}//END OF ALERT CONTROLLER EXTENSION
