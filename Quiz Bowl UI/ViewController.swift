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

    @IBAction func lightningRoundButton(sender: AnyObject) {
        Data.isLightningRound = true
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
    }

    @IBAction func Team1TenPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(0, gotBonus: false)
        Data.question++
        //make changes to text
        updateText()
        
    }

    @IBAction func Team1BonusPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(0, gotBonus: true)
        Data.question++
        //make changes to text
        updateText()

    }

    @IBAction func Team2TenPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(1, gotBonus: false)
        Data.question++
        //make changes to text
        updateText()

    }
    
    @IBAction func Team2BonusPoints(sender: AnyObject) {
        //make changes to data
        Data.winRound(1, gotBonus: true)
        Data.question++
        //make changes to text
        updateText()

    }
    
    @IBAction func RestartGameButton(sender: AnyObject) {
        Data.reset()
        dismissController(ViewController)
    }
    
    /*tableView black magic
    func reloadFileList() {
        directoryItems = directory?.contentsOrderedBy(sortOrder, ascending: sortAscending)
        scoreTable.reloadData()
    }*/
}
    

/*black magic so that the table will work

extension ViewController : NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return directoryItems?.count ?? 0
    }
}

extension ViewController : NSTableViewDelegate {
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var image:NSImage?
        var text:String = ""
        var cellIdentifier: String = ""
        
        // 1
        guard let item = directoryItems?[row] else {
            return nil
        }
        
        // 2
        if tableColumn == tableView.tableColumns[0] {
            image = item.icon
            text = item.name
            cellIdentifier = "NameCellID"
        } else if tableColumn == tableView.tableColumns[1] {
            text = item.date.description
            cellIdentifier = "DateCellID"
        } else if tableColumn == tableView.tableColumns[2] {
            text = item.isFolder ? "--" : sizeFormatter.stringFromByteCount(item.size)
            cellIdentifier = "SizeCellID"
        }
        
        // 3
        if let cell = tableView.makeViewWithIdentifier(cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            cell.imageView?.image = image ?? nil
            return cell
        }
        return nil
    }
}*/


