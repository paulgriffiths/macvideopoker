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
    @IBOutlet weak var royalFlushPayoutLabel: NSTextField?
    @IBOutlet weak var straightFlushPayoutLabel: NSTextField?
    @IBOutlet weak var fourPayoutLabel: NSTextField?
    @IBOutlet weak var fullHousePayoutLabel: NSTextField?
    @IBOutlet weak var flushPayoutLabel: NSTextField?
    @IBOutlet weak var straightPayoutLabel: NSTextField?
    @IBOutlet weak var threePayoutLabel: NSTextField?
    @IBOutlet weak var twoPairPayoutLabel: NSTextField?
    @IBOutlet weak var jacksPayoutLabel: NSTextField?
    
    private let machine: SingleBettingMachine = SingleBettingMachine()
    private let deck = Deck()
    private var winComputer: PokerHandWinRatioComputer = VideoPokerHandEasyWinRatioComputer()
    
    dynamic var actionButtonTitle: String = "Deal"
    dynamic var statusMessage: String = "Click \"Deal\" button to begin"
    
    var easyDifficulty: Bool = true {
        didSet {
            winComputer = easyDifficulty ? VideoPokerHandEasyWinRatioComputer() : VideoPokerHandNormalWinRatioComputer()
            setPayoutLabels()
        }
    }
    
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
        setPayoutLabels()
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
                
                let win = winComputer.winRatioForHand(hand)
                let winnings = machine.win(win.winRatio)
                let winString = (winnings > 0 ? "You won $\(winnings)!" : "No win!")
                statusMessage = "\(win.description)! \(winString) Click \"\(actionButtonTitle)\" to play again"
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
    
    private func setPayoutLabels() {
        royalFlushPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.KingClubs, Cards.QueenClubs, Cards.JackClubs, Cards.TenClubs)).winRatio
        straightFlushPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.NineClubs, Cards.KingClubs, Cards.QueenClubs, Cards.JackClubs, Cards.TenClubs)).winRatio
        fourPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.AceHearts, Cards.AceSpades, Cards.AceDiamonds, Cards.KingClubs)).winRatio
        fullHousePayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.AceHearts, Cards.AceSpades, Cards.KingDiamonds, Cards.KingClubs)).winRatio
        flushPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.QueenClubs, Cards.TenClubs, Cards.EightClubs, Cards.SixClubs)).winRatio
        straightPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.NineClubs, Cards.KingHearts, Cards.QueenSpades, Cards.JackDiamonds, Cards.TenClubs)).winRatio
        threePayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.AceHearts, Cards.AceSpades, Cards.QueenDiamonds, Cards.KingClubs)).winRatio
        twoPairPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.AceHearts, Cards.QueenSpades, Cards.QueenDiamonds, Cards.KingClubs)).winRatio
        jacksPayoutLabel?.integerValue = winComputer.winRatioForHand(PokerHand(cards: Cards.AceClubs, Cards.AceHearts, Cards.JackSpades, Cards.QueenDiamonds, Cards.KingClubs)).winRatio
    }
}
