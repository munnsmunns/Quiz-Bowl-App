//
//  Data.swift
//  Quiz Bowl UI
//
//  Created by MUNNS, MATTHEW on 2/16/16.
//  Copyright © 2016 MUNNS, MATTHEW. All rights reserved.
//

import Cocoa

public class Data {
    public static var team1Name = "Team 1"
    
    public static var team2Name = "Team 2"
    
    public static var scores = [[Int]](count: 2, repeatedValue: [Int](count: 61, repeatedValue: 0) )
    
    public static var question = 1
    
    public static let WIN = 10, BONUS = 5
    
    //find the sum of a teams score. first team == 0 second team == 1.
    static func teamScore(team: Int) -> Int {
        var sum = 0
        //add up sum
        for score in scores[team] {
            sum += score
        }
        return sum
    }
    
    static func winRound(team: Int, gotBonus: Bool) -> Void {
        //bounds check
        if question >= scores[0].count || question < 0 || team < 0 ||
            team >= scores.count {
                return
        }
        
        //apply bonus if necessary
        var extra = 0
    
        if gotBonus {
            extra = BONUS
        }
        
        scores[team][question] = WIN + extra
        
        return
    }
    
    static func lightningRound(team1Score: Int, team2Score: Int) -> Void {
        
        scores[0][0] += team1Score
        scores[1][0] += team2Score
        return
        
    }

}