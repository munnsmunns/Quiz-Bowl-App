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

    //they all weak like josh
    @IBOutlet weak var team1Round1: NSTextField!
    @IBOutlet weak var team1Round2: NSTextField!
    @IBOutlet weak var team2Round1: NSTextField!
    @IBOutlet weak var team2Round2: NSTextField!
    @IBOutlet weak var team1NameChange: NSTextField!
    @IBOutlet weak var team2NameChange: NSTextField!
    @IBOutlet weak var changeGameButton: NSButton!
    @IBOutlet weak var mainTitle: NSTextField!
    @IBOutlet var settingsViewController: NSView!
    @IBOutlet weak var timerLabel60: NSTextField!
    @IBOutlet weak var timerLabel30: NSTextField!
    @IBOutlet weak var timerButton60: NSButton!
    @IBOutlet weak var timerButton30: NSButton!
    
    var timer60 = NSTimer()
    var timer30 = NSTimer()
    var counter60 = 60
    var counter30 = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        //Make sure the button shows the right text in the settings page
        if  super.title == "Settings" && Data.title == "GRAB THAT MARKER" {
            changeGameButton.title = "Change to QUIZ BOWL"
        }
        
    }
    
    func updateCounter60() {
        counter60 -= 1
        
        
        switch (counter60){
        //display STOP when it reaches zero
        case 0:
            timerLabel60.stringValue = "STOP"
        //after one second, stop and reset the timer
        case -1:
            counter60 = 60
            timer60.invalidate()
            timerLabel60.stringValue = String(counter60)
            timerLabel60.textColor = NSColor.blackColor()

        default:
            timerLabel60.stringValue = String(counter60)
        }
    }
    
    func updateCounter30() {
        counter30 -= 1
        
        switch (counter30){
            //display STOP when it reaches zero
        case 0:
            timerLabel30.stringValue = "STOP"
            //after one second, stop and reset the timer
        case -1:
            counter30 = 30
            timer30.invalidate()
            timerLabel30.stringValue = String(counter30)
            timerLabel30.textColor = NSColor.blackColor()

        default:
            timerLabel30.stringValue = String(counter30)
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
        
        Data.reset()
        
    }
    @IBAction func timer60(sender: AnyObject) {
        if timerButton60.title == "Start" {
            timer60 = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateCounter60", userInfo: nil, repeats: true)
            timerButton60.title = "Reset"
            timerLabel60.textColor = NSColor.blueColor()
        }
        else {
            counter60 = 60
            timer60.invalidate()
            timerLabel60.stringValue = String(counter60)
            timerLabel60.textColor = NSColor.blackColor()
            timerButton60.title = "Start"
        }
    }
    
    @IBAction func timer30(sender: AnyObject) {
        
        if timerButton30.title == "Start" {
            timer30 = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateCounter30", userInfo: nil, repeats: true)
            timerButton30.title = "Reset"
            timerLabel30.textColor = NSColor.blueColor()

        }
        else {
            counter30 = 30
            timer30.invalidate()
            timerLabel30.stringValue = String(counter30)
            timerLabel30.textColor = NSColor.blackColor()
            timerButton30.title = "Start"
        }

    }
    
    weak var delegate: DetailsDelegate?
    //call updateText function when window closes
    override func viewDidDisappear() {
        super.viewWillDisappear()
        
        delegate?.updateText()
    }
    
    

    
}
