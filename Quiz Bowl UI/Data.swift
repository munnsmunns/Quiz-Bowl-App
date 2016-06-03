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
    
    public static var scores = [[Int]](count: 2, repeatedValue: [Int](count: 1001, repeatedValue: 0) )
    
    public static var tempScores = scores
    
    public static var question = 1
    
    public static let WIN = 10, BONUS = 5
    
    public static var title = "QUIZ BOWL"
    
    //find the sum of a teams score. first team == 0 second team == 1.
    static func teamScore(team: Int) -> Int {
        var sum = 0
        //add up sum
        for score in scores[team] {
            sum += score
        }
        return sum
    }
    
    //adds proper amount of points from winning into the array
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
        question++
        
        //update tempScores, which is used for the redo button
        tempScores = scores
        
        return
    }
    
    //sum of lightning round points stored in question 0 of the array
    static func lightningRound(team1Score: Int, team2Score: Int) -> Void {
        
        //lightning round score is saved in "question 0"
        scores[0][0] += team1Score
        scores[1][0] += team2Score
        return
        
    }
    
    static func reset() ->  Void {
        //reset data to initial value
        question = 1
        let size = scores[0].count
        for var x = 0; x < size; x++ {
            scores[0][x] = 0
            scores[1][x] = 0
        }
    }
    
    static func undo() -> Void {
        //bounds check
        if question > 1 {
            question--
        }
        
        //reset scores in previous question
        scores[0][question] = 0
        scores[1][question] = 0
    }
    
    static func redo() -> Void {
        //bounds check and make sure you can't redo too far
        if (question >= scores[0].count || (tempScores[0][question] <= 0 &&
            tempScores[1][question] <= 0)) {
                
                return
        }
        //tempScores saves the previous values for each question
        scores[0][question] = tempScores[0][question]
        scores[1][question] = tempScores[1][question]
        
        question++

    }

}