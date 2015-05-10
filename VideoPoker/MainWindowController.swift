//
//  MainWindowController.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

private func randomPokerHand() -> PokerHand {
    var list = CardList()
    for i in 0...4 {
        let n = Int(arc4random_uniform(52))
        list.append(Card(index: n))
    }
    return PokerHand(cardList: list)
}

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var pokerHandView: PokerHandView?
    @IBOutlet weak var flipButton: NSButton?
    
    private var flippingEnabled: Bool = true {
        didSet {
            pokerHandView?.enabled = flippingEnabled
            flipButton?.title = flippingEnabled ? "Disable flipping" : "Enable flipping"
        }
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func enableButtonPressed(sender: NSButton) {
        flippingEnabled = !flippingEnabled
    }
    
    @IBAction func dealButtonPressed(sender: NSButton) {
        flippingEnabled = true
        pokerHandView?.hand = randomPokerHand()
        flipButton?.enabled = true
    }
    
    @IBAction func discardButtonPressed(sender: NSButton) {
        flippingEnabled = true
        pokerHandView?.hand = nil
        flipButton?.enabled = false
    }
}
