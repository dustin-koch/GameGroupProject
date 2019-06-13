//
//  ChampionsViewController.swift
//  TeamGame
//
//  Created by winston salcedo on 6/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class ChampionsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK: - Actions
    @IBAction func leaderboardTapped(_ sender: UIButton) {
    }
    @IBAction func playAgainTapped(_ sender: UIButton) {
        QuestionController.sharedInstance.questionNumber = 0
        QuestionController.sharedInstance.score = 0
        QuestionController.sharedInstance.fetchAllQuestions { (questions) in
            guard let questions = questions else { return }
            QuestionController.sharedInstance.questionSet = questions
            DispatchQueue.main.async {
                let vc = QuestionViewController()
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    @IBAction func quitTapped(_ sender: UIButton) {
        QuestionController.sharedInstance.resetGame()
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Helper functions
    
    func updateView() {
        userLabel.text = "Congratulations, \(QuestionController.sharedInstance.userName)"
        updateWinnerMessage()
    }
    
    func updateWinnerMessage() {
        switch QuestionController.sharedInstance.score {
        case 1...4:
            winnerLabel.text = "Whoa. Go back to school, sucka...\nPoints: \(QuestionController.sharedInstance.score)"
        case 5...7:
            winnerLabel.text = "Not bad, keep trying\nPoints: \(QuestionController.sharedInstance.score)"
        case 8...9:
            winnerLabel.text = "Sizzlin' score! You're on fire!\nPoints: \(QuestionController.sharedInstance.score)"
        case 10:
            winnerLabel.text = "Perfect. You da bomb dot com!\nPoints: \(QuestionController.sharedInstance.score)"
        default:
            winnerLabel.text = "You won!!"
        }
    }
}//END OF CLASS
