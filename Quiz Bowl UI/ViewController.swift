//
//  ViewController.swift
//  Quiz Bowl UI
//
//  Created by MUNNS, MATTHEW on 11/4/15.
//  Copyright © 2015 MUNNS, MATTHEW. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    //
    @IBOutlet weak var score1TextField: NSTextField!

    @IBOutlet weak var roundNumberTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // I like trains
    var scores = [[Int]](count: 2, repeatedValue: [Int](count: 60, repeatedValue: 0) )
    
    var round = 1
    
    let WIN = 10, BONUS = 5
    
    //find the sum of a teams score. first team == 0 second team == 1.
    func teamScore(scores: [[Int]], team: Int) -> Int {
        var sum = 0
        //add up sum
        for score in scores[team] {
            sum += score
        }
        return sum
    }
    
    func winRound(var scores: [[Int]], team: Int, round: Int, gotBonus: Bool) -> [[Int]] {
        //bounds check
        if round >= scores[0].count || round < 0 || team < 0 ||
            team >= scores.count {
            return scores
        }
        
        //apply bonus if necessary
        var extra = 0
        
        if gotBonus {
            extra = BONUS
        }
        
        scores[team][round] = WIN + extra
        
        return scores
    }
    
    func updateText() -> Void {
        //team scores
        score1TextField.stringValue = String(teamScore(scores, team: 0))
        /*score2TextField.stringValue = String(teamScore(scores, team: 1))
        */
        
        //Round number
        roundNumberTextField.stringValue = String(round)
        
    }

    @IBAction func Team1TenPoints(sender: AnyObject) {
        //make changes to data
        scores = winRound(scores, team: 0, round: round, gotBonus: false)
        round++
        //make changes to text
        updateText()
        
    }


}

