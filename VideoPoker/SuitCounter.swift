//
//  SuitCounter.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class SuitCounter {
    private var suits: [Suit : Int] = [:]
    
    init(list: CardList) {
        for card in list {
            countCard(card)
        }
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
        if let _ = suits[suit] {
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
    
    func numSuits() -> Int {
        return suits.count
    }
}