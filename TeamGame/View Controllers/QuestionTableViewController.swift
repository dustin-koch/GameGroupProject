//
//  QuestionTableViewController.swift
//  TeamGame
//
//  Created by winston salcedo on 6/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    var question: SpecificQuestion?
    var questionArray: [String] = []
    
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aButtonLabel: UIButton!
    @IBOutlet weak var bButtonLabel: UIButton!
    @IBOutlet weak var cButtonLabel: UIButton!
    @IBOutlet weak var dButtonLabel: UIButton!
    @IBOutlet weak var userStatsButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        updateButtons()
    }
    
    @IBAction func aButtonTapped(_ sender: UIButton) {
        
    }
    @IBAction func bButtonTapped(_ sender: UIButton) {
    }
    @IBAction func cButtonTapped(_ sender: UIButton) {
    }
    @IBAction func dButtonTapped(_ sender: UIButton) {
    }
    
    func updateViews() {
        guard let questions = QuestionController.sharedInstance.questionSet else { return }
        DispatchQueue.main.async {
            self.questionCountLabel.text = "\(QuestionController.sharedInstance.questionNumber + 1)/10"
            self.questionLabel.text = "\(questions[QuestionController.sharedInstance.questionNumber].question)"
            self.categoryLabel.text = "\(questions[QuestionController.sharedInstance.questionNumber].category)"
            self.scoreLabel.text = "\(QuestionController.sharedInstance.score)"
            self.questionArray = QuestionController.sharedInstance.makeQuestionsArray(question: questions[QuestionController.sharedInstance.questionNumber])
            self.userStatsButtonLabel.setTitle("\(QuestionController.sharedInstance.userName)", for: .normal)
        }
    }
    
    func updateButtons() {
        DispatchQueue.main.async {
            self.aButtonLabel.setTitle(self.questionArray[0], for: .normal)
            self.bButtonLabel.setTitle(self.questionArray[1], for: .normal)
            self.cButtonLabel.setTitle(self.questionArray[2], for: .normal)
            self.dButtonLabel.setTitle(self.questionArray[3], for: .normal)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
