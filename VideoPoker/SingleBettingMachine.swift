//
//  SingleBettingMachine.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/19/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

class SingleBettingMachine {
    private(set) var pot: Int
    private(set) var currentBet: Int
    private(set) var defaultBet: Int
    private var betState: BetState
    
    var isOutOfMoney: Bool {
        get {
            return betState == .OutOfMoney
        }
    }
    
    private enum BetState {
        case BetInProgress
        case ReadyForBet
        case OutOfMoney
    }
    
    convenience init() {
        self.init(pot: 100, defaultBet: 5)
    }
    
    init(pot: Int, defaultBet: Int) {
        self.pot = pot
        self.defaultBet = defaultBet
        self.currentBet = self.defaultBet
        self.betState = .ReadyForBet
    }
    
    func validateBet(amount: Int) -> Bool {
        return amount > 0 && amount <= pot 
    }
    
    func bet(amount: Int) {
        precondition(betState == .ReadyForBet, "Betting machine is not ready for bet")
        precondition(amount <= pot, "You cannot bet more than there is in the pot")
        precondition(amount > 0, "You must bet more than zero")
        
        currentBet = amount
        pot -= amount
        betState = .BetInProgress
    }
    
    func win(winRatio: Int) -> Int {
        precondition(betState == .BetInProgress, "Betting machine is not ready for a win")
        precondition(winRatio >= 0, "Win ratio must be greater than or equal to zero")
        
        let amountWon = currentBet * winRatio
        pot += amountWon
        betState = (pot == 0 ? .OutOfMoney : .ReadyForBet)
        if currentBet > pot {
            currentBet = pot
        }
        return amountWon
    }

}
