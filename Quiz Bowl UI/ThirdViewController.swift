//
//  ThirdViewController.swift
//  Quiz Bowl UI
//
//  Created by RAWSON, WYATT on 4/28/16.
//  Copyright © 2016 MUNNS, MATTHEW. All rights reserved.
//

import Foundation
import AppKit

class ThirdViewController: NSViewController {
    
    @IBOutlet weak var congratsTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set label to say the score difference and which team won
        var points = Data.teamScore(1) - Data.teamScore(2)
        points = abs(points)
        
        if Data.teamScore(1) > Data.teamScore(2) {
            congratsTextField.stringValue = String(Data.team1Name) + " beat " + String(Data.team2Name) + " by " + String(points) + " points!"
        }
        else if(Data.teamScore(2) > Data.teamScore(1)) {
            congratsTextField.stringValue = String(Data.team2Name) + " beat " + String(Data.team1Name) + " by " + String(points) + " points!"
        }
        else {
            congratsTextField.stringValue = "It's a tie!"
        }

    }
    
}