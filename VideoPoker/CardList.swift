//
//  CardList.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

class CardList: SequenceType {
    private var cards: [Card] = []
    
    init() {
        
    }
    
    init(cards: Card...) {
        self.cards.extend(cards)
    }
    
    init(cards: Cards...) {
        for card in cards {
            self.cards.append(card.card)
        }
    }
    
    var isEmpty: Bool {
        return cards.isEmpty
    }
    
    var count: Int {
        return cards.count
    }
    
    subscript(index: Int) -> Card {
        get {
            return cards[index]
        }
        
        set {
            cards[index] = newValue
        }
    }
    
    func generate() -> IndexingGenerator<[Card]> {
        return cards.generate()
    }
}
