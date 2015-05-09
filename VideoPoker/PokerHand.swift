//
//  PokerHand.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class PokerHand: Hand {
    override init(cardList: CardList) {
        precondition(cardList.count == 5, "Poker hands must have exactly five cards")
        super.init(cardList: cardList)
    }
}