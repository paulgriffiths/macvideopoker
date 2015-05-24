//
//  SuitCounter.swift
//
//  Utility struct to calculate the numbers of distinct suits
//  in a list of playing cards, for instance to determine how
//  many clubs or hearts are present in the list.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

struct SuitCounter {
    private var suits: [Suit : Int] = [:]
    
    init(cardList: CardList) {
        for card in cardList {
            countCard(card)
        }
    }
    
    var count: Int {
        return suits.count
    }
    
    mutating private func countCard(card: Card) {
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