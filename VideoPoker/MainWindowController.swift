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
    @IBOutlet weak var potLabel: NSTextField?
    @IBOutlet weak var betLabel: NSTextField?
    
    dynamic var actionButtonTitle: String = "Deal"
    dynamic var statusMessage: String = "Click \"Deal\" button to begin"
    private let machine: SingleBettingMachine = SingleBettingMachine()
    private let deck = Deck()
    
    dynamic var canExchange: Bool = false {
        didSet {
            pokerHandView?.enabled = canExchange
            actionButtonTitle = canExchange ? "Exchange" : "Deal"
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        potLabel?.integerValue = machine.pot
        betLabel?.integerValue = machine.currentBet
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func actionButtonPressed(sender: NSButton) {
        canExchange = !canExchange
        if canExchange {
            pokerHandView?.hand = discardAndDrawNewHand()
            statusMessage = "Click on cards to flip, then click \"\(actionButtonTitle)\" to exchange them"
            machine.bet(betLabel!.integerValue)
            potLabel?.integerValue = machine.pot
        }
        else {
            if let hand = pokerHandView?.hand, let array = pokerHandView?.flippedArray {
                if !array.isEmpty {
                    hand.exchange(deck, exchangeArray: array)
                    pokerHandView?.hand = hand
                }
                let type = PokerHandEvaluation(hand: hand).handType
                
                let winnings = machine.win(VideoPokerHandEasyWinRatioComputer().winRatioForHand(type))
                let winString = (winnings > 0 ? "You won $\(winnings)!" : "No win!")
                statusMessage = "\(type)! \(winString) Click \"\(actionButtonTitle)\" to play again"
                potLabel?.integerValue = machine.pot
                betLabel?.integerValue = machine.currentBet
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
