//
//  SuitCounter.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class SuitCounter {
    private var suits: [Suit : Int] = [:]
    
    init(cardList: CardList) {
        for card in cardList {
            countCard(card)
        }
    }
    
    var count: Int {
        return suits.count
    }
    
    private func countCard(card: Card) {
        if let count = suits[card.suit] {
            suits[card.suit] = count + 1
        }
        else {
            suits[card.suit] = 1
        }
    }
    
    func containsSuit(suit: Suit) -> Bool {
        if suits[suit] != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func countForSuit(suit: Suit) -> Int {
        if let count = suits[suit] {
            return count
        }
        else {
            return 0
        }
    }
    
}