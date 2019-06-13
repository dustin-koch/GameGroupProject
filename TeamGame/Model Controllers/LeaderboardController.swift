//
//  LeaderboardController.swift
//  TeamGame
//
//  Created by Dustin Koch on 6/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

class LeaderboardController {
    
    //MARK: - Singleton
    static let sharedInstance = LeaderboardController()
    private init() {}
    
    //MARK: - Source of truth
    var currentLeaderboard: [String:Int] = [:]
    
    func addNewScoreWith(name: String, score: Int) {
        currentLeaderboard[name] = score
    }
}
