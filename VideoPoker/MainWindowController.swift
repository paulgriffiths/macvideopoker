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
    @IBOutlet weak var flipButton: NSButton?
    
    private var flippingEnabled: Bool = true {
        didSet {
            if let phv = pokerHandView {
                phv.enabled = flippingEnabled
            }
            if let flipButton = flipButton {
                flipButton.title = (flippingEnabled ? "Disable flipping" : "Enable flipping")
            }
        }
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func enableButtonPressed(sender: NSButton) {
        if let phv = pokerHandView {
            flippingEnabled = !flippingEnabled
        }
    }
    
    @IBAction func dealButtonPressed(sender: NSButton) {
        if let phv = pokerHandView {
            var list = CardList()
            for i in 0...4 {
                let n = Int(arc4random_uniform(52))
                list.append(Card(index: n))
            }
            phv.hand = PokerHand(cardList: list)
            if let flipButton = flipButton {
                flipButton.enabled = true
                flippingEnabled = true
            }
        }
    }
    
    @IBAction func discardButtonPressed(sender: NSButton) {
        if let phv = pokerHandView {
            phv.hand = nil
            if let flipButton = flipButton {
                flipButton.enabled = false
                flippingEnabled = true
            }
        }
    }
}
