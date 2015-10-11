//
//  CardList.swift
//
//  Container to hold a list of playing cards.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

import Darwin

struct CardList: SequenceType, CustomStringConvertible {
    private var cards: [Card] = []
    
    init() {
        
    }
    
    init(cards: Card...) {
        self.cards.appendContentsOf(cards)
    }
    
    init(cards: Cards...) {
        for card in cards {
            self.cards.append(card.card)
        }
    }
    
    init(cards: [Card]) {
        self.cards.appendContentsOf(cards)
    }
    
    init(cards: [Cards]) {
        for card in cards {
            self.cards.append(card.card)
        }
    }
    
    var description: String {
        var string = "["
        var separator: String?
        
        for card in cards {
            if let sep = separator {
                string += sep
            }
            else {
                separator = ","
            }
            
            string += card.shortDescription
        }
        
        string += "]"
        return string
    }
    
    var isEmpty: Bool {
        return cards.isEmpty
    }
    
    var count: Int {
        return cards.count
    }
    
    mutating func append(card: Card) {
        cards.append(card)
    }
    
    mutating func append(card: Cards) {
        append(card.card)
    }
    
    mutating func append(cardList: CardList) {
        cards.appendContentsOf(cardList.cards)
    }
    
    mutating func removeLast() -> Card {
        return cards.removeLast()
    }
    
    subscript(index: Int) -> Card {
        get {
            return cards[index]
        }
        
        set {
            cards[index] = newValue
        }
    }
    
    mutating func clear() {
        cards.removeAll(keepCapacity: false)
    }
    
    mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            swap(&self[i], &self[j])
        }
    }
    
    func generate() -> IndexingGenerator<[Card]> {
        return cards.generate()
    }
}
