//
//  MainWindowController.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

private let initialButtonTitle = "Deal"
private let initialStatusMessage = "Click \"Deal\" button to begin"
private let initialCanExchangeValue = false

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
    
    private var machine: SingleBettingMachine = SingleBettingMachine()
    private let deck = Deck()
    private var winComputer: PokerHandWinRatioComputer = VideoPokerHandEasyWinRatioComputer()
    
    dynamic var actionButtonTitle: String = initialButtonTitle
    dynamic var statusMessage: String = initialStatusMessage
    
    var easyDifficulty: Bool = true {
        didSet {
            winComputer = easyDifficulty ? VideoPokerHandEasyWinRatioComputer() : VideoPokerHandNormalWinRatioComputer()
            setPayoutLabels()
        }
    }
    
    dynamic var canExchange: Bool = initialCanExchangeValue {
        didSet {
            pokerHandView?.enabled = canExchange
            actionButtonTitle = canExchange ? "Exchange" : "Deal"
            enableAppDelegateDifficultyMenu(!canExchange)
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        if let formatter = potLabel?.formatter as? NSNumberFormatter {
            formatter.maximumFractionDigits = 0
        }
        if let formatter = betLabel?.formatter as? NSNumberFormatter {
            formatter.maximumFractionDigits = 0
        }
        updatePotAndBetFields()
        setPayoutLabels()
    }
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    @IBAction func actionButtonPressed(sender: NSButton) {
        if !canExchange {
            if !validateBet() {
                return
            }
        }
        
        canExchange = !canExchange
        
        if canExchange {
            pokerHandView?.hand = discardAndDrawNewHand()
            statusMessage = "Click on cards to flip, then click \"\(actionButtonTitle)\" to exchange them"
            machine.bet(betLabel!.integerValue)
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
                statusMessage = "\(win.description)! \(winString) Click \"\(actionButtonTitle)\" to play again"            }
        }
        
        updatePotAndBetFields()
    }
    
    func resetGame() {
        discardHandIfPresent()
        pokerHandView?.hand =  nil
        actionButtonTitle = initialButtonTitle
        statusMessage = initialStatusMessage
        canExchange = initialCanExchangeValue
        machine = SingleBettingMachine()
        updatePotAndBetFields()
    }
    
    private func validateBet() -> Bool {
        if let betLabel = betLabel {
            if betLabel.integerValue > machine.pot {
                badBetAlert("You cannot bet more than the pot")
                return false
            }
            else if betLabel.integerValue < 1 {
                badBetAlert("You must bet a positive amount")
                return false
            }
            return true
        }
        else {
            return false
        }
    }
    
    private func badBetAlert(message: String) {
        let alert = NSAlert()
        alert.messageText = "Invalid bet."
        alert.informativeText = message
        alert.runModal()
        updatePotAndBetFields()
    }
    
    private func enableAppDelegateDifficultyMenu(enabled: Bool) {
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.difficultyMenu?.enabled = enabled
    }
    
    private func updatePotAndBetFields() {
        potLabel?.integerValue = machine.pot
        betLabel?.integerValue = machine.currentBet
    }
    
    private func discardAndDrawNewHand() -> PokerHand {
        discardHandIfPresent()
        deck.shuffle()
        return PokerHand(cardList: deck.drawCards(5))
    }
    
    private func discardHandIfPresent() {
        if let hand = pokerHandView?.hand {
            deck.discard(hand)
            deck.replaceDiscards()
        }
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
