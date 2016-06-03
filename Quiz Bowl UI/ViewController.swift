//
//  ViewController.swift
//  Quiz Bowl UI
//
//  Created by MUNNS, MATTHEW on 11/4/15.
//  Copyright © 2015 MUNNS, MATTHEW. All rights reserved.
//

import Cocoa
import AppKit


class ViewController: NSViewController, DetailsDelegate {
    

    @IBOutlet weak var score1TextField: NSTextField!
    
    @IBOutlet weak var score2TextField: NSTextField!

    @IBOutlet weak var roundNumberTextField: NSTextField!
    
    @IBOutlet weak var scoreTable: NSTableView!
    
    @IBOutlet weak var team1TextField: NSTextField!
    
    @IBOutlet weak var team2TextField: NSTextField!
    
    @IBOutlet weak var titleTextField: NSTextField!
    
    @IBOutlet weak var possessionButton: NSButton!
    
    @IBOutlet weak var team1Img: NSImageView!
    
    @IBOutlet weak var team2Img: NSImageView!
    
    @IBOutlet weak var sneaky: NSImageView!
    
    @IBOutlet weak var lightningRoundButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*scoreTable.setDelegate(self)
        scoreTable.setDataSource(self)*/

        updateText()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        /*directory = Directory(folderURL: url)
        reloadFileList()*/

        }
    }
   
    //allows updateText to be called by SecondViewController
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        
        //only use changes with lightning round
            
        let controller: SecondViewController! = segue.destinationController as! SecondViewController
        controller.delegate = self

    }
    
    func updateText() -> Void {
        //team scores
        score1TextField.stringValue = String(Data.teamScore(0))
        score2TextField.stringValue = String(Data.teamScore(1))
        
        //question number
        roundNumberTextField.stringValue = String(Data.question)
        
        
        
        //team names
        team1TextField.stringValue = Data.team1Name
        team2TextField.stringValue = Data.team2Name
        
        //game title
        titleTextField.stringValue = Data.title
        
        //possession for GTM
        if (Data.title == "GRAB THAT MARKER") {
            possessionButton.hidden = false
            lightningRoundButton.hidden = true
            sneaky.hidden = true
        }
        else {
            possessionButton.hidden = true
            lightningRoundButton.hidden = false
            sneaky.hidden = false
        }
    }

    @IBAction func Team1TenPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(0, gotBonus: false)
        //make changes to text
        updateText()
        
    }

    @IBAction func Team1BonusPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(0, gotBonus: true)
        //make changes to text
        updateText()

    }

    @IBAction func Team2TenPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(1, gotBonus: false)
        //make changes to text
        updateText()

    }
    
    @IBAction func Team2BonusPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(1, gotBonus: true)
        //make changes to text
        updateText()

    }
    
    @IBAction func RestartGameButton(sender: AnyObject) {
        Data.reset()
        updateText()
    }
    
    @IBAction func UndoButton(sender: AnyObject) {
        Data.undo()
        updateText()
    }
    
    @IBAction func RedoButton(sender: AnyObject) {
        Data.redo()
        updateText()
    }
    
    @IBAction func ChangePossessionButton(sender: AnyObject) {
        team1Img.hidden = !team1Img.hidden
        team2Img.hidden = !team2Img.hidden

    }

}