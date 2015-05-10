//
//  MainWindowController.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var pokerHandView: PokerHandView?

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func enableButtonPressed(sender: NSButton) {
        if let phv = pokerHandView {
            phv.enabled = !phv.enabled
            if phv.enabled {
                sender.title = "Disable flipping"
            }
            else {
                sender.title = "Enable flipping"
            }
        }
    }
}
