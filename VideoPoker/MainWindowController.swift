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
    
    private var deck = Deck()
    
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
        discardCurrentHand()
        pokerHandView?.hand = drawNewHand()
        flipButton?.enabled = true
    }
    
    @IBAction func discardButtonPressed(sender: NSButton) {
        discardCurrentHand()
        flipButton?.enabled = false
    }
    
    private func discardCurrentHand() {
        flippingEnabled = true
        if let hand = pokerHandView?.hand {
            deck.discard(hand)
            deck.replaceDiscards()
        }
        pokerHandView?.hand = nil
    }
    
    private func drawNewHand() -> PokerHand {
        deck.shuffle()
        return PokerHand(cardList: deck.drawCards(5))
    }
}
