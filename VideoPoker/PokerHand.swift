//
//  PokerHand.swift
//
//  Class to represent a poker hand.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

class PokerHand: Hand {
    override init(cardList: CardList) {
        precondition(cardList.count == 5, "Poker hands must have exactly five cards")
        super.init(cardList: cardList)
    }
}