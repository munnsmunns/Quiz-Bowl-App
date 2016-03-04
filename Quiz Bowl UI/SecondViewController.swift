//
//  SecondViewController.swift
//  Quiz Bowl UI
//
//  Created by MUNNS, MATTHEW on 2/9/16.
//  Copyright © 2016 MUNNS, MATTHEW. All rights reserved.
//

import Cocoa
import AppKit

public protocol DetailsDelegate: class {
    func updateText()
}

class SecondViewController: NSViewController {

    @IBOutlet weak var team1Round1: NSTextField!
    @IBOutlet weak var team1Round2: NSTextField!
    @IBOutlet weak var team2Round1: NSTextField!
    @IBOutlet weak var team2Round2: NSTextField!
    @IBOutlet weak var team1NameChange: NSTextField!
    @IBOutlet weak var team2NameChange: NSTextField!
    @IBOutlet weak var changeGameButton: NSButton!
    @IBOutlet weak var mainTitle: NSTextField!
    @IBOutlet var settingsViewController: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        //Make sure the button shows the right text in the settings page
        if  super.title == "Settings" && Data.title == "GRAB THAT MARKER" {
            changeGameButton.title = "Change to QUIZ BOWL"
        }
    }
    
    @IBAction func clickDoneButton(sender: AnyObject) {
        //Add points to team scores
        var team1Score:Int
        var team2Score:Int
        
        team1Score = team1Round1.integerValue + team1Round2.integerValue
        team2Score = team2Round1.integerValue + team2Round2.integerValue
        
        Data.lightningRound(team1Score, team2Score: team2Score)
        
        dismissController(SecondViewController)
        
    }
    
    @IBAction func nameDoneButton(sender: AnyObject) {
        let name1 = team1NameChange.stringValue
        let name2 = team2NameChange.stringValue
        
        if !name1.isEmpty {
            Data.team1Name = name1
        }
        if !name2.isEmpty
        {
            Data.team2Name = name2
        }
        
        dismissController(SecondViewController)
    }
    
    @IBAction func changeGameButton(sender: AnyObject) {
        changeGameButton.title = "Change to " + Data.title
        
        if Data.title == "QUIZ BOWL" {
            Data.title = "GRAB THAT MARKER"
        }
        else {
            Data.title = "QUIZ BOWL"
        }
        
    }
    
    weak var delegate: DetailsDelegate?
    //call updateText function when window closes
    override func viewDidDisappear() {
        super.viewWillDisappear()
        
        delegate?.updateText()
    }
    

    
}
