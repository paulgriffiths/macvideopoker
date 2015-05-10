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
    
    dynamic var actionButtonTitle: String = "Deal"
    dynamic var statusMessage: String = "Click \"Deal\" button to begin"
    private var deck = Deck()
    
    private var canExchange: Bool = false {
        didSet {
            pokerHandView?.enabled = canExchange
            actionButtonTitle = canExchange ? "Exchange" : "Deal"
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func actionButtonPressed(sender: NSButton) {
        canExchange = !canExchange
        if canExchange {
            pokerHandView?.hand = discardAndDrawNewHand()
            statusMessage = "Click on cards to flip, then click \"\(actionButtonTitle)\" to exchange them"
        }
        else {
            if let hand = pokerHandView?.hand, let array = pokerHandView?.flippedArray {
                if !array.isEmpty {
                    hand.exchange(deck, exchangeArray: array)
                    pokerHandView?.hand = hand
                }
                statusMessage = "\(PokerHandEvaluation(hand: hand).handType)! Click \"\(actionButtonTitle)\" to play again"
            }
        }
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
