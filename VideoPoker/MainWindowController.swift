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
    @IBOutlet weak var dealButton: NSButton?
    @IBOutlet weak var statusLabel: NSTextField?
    
    private var deck = Deck()
    
    private var canExchange: Bool = false {
        didSet {
            pokerHandView?.enabled = canExchange
            dealButton?.title = canExchange ? "Exchange" : "Deal"
        }
    }
    
    private var statusMessage: String = "" {
        didSet {
            statusLabel?.stringValue = statusMessage
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func dealButtonPressed(sender: NSButton) {
        if canExchange {
            if let hand = pokerHandView?.hand, let array = pokerHandView?.flippedArray {
                if array.count > 0 {
                    hand.exchange(deck, exchangeArray: array)
                    pokerHandView?.hand = hand
                }
                
                let pe = PokerHandEvaluation(hand: hand)
                statusMessage = "\(pe.handType)! Click \"Deal\" to play again"
            }
        }
        else {
            pokerHandView?.hand = discardAndDrawNewHand()
            statusMessage = "Click on cards to flip, then click \"Exchange\" to exchange them"
        }
        canExchange = !canExchange
    }
    
    private func discardAndDrawNewHand() -> PokerHand {
        if let hand = pokerHandView?.hand {
            deck.discard(hand)
            deck.replaceDiscards()
        }
        deck.shuffle()
        return PokerHand(cardList: deck.drawCards(5))
    }
}
