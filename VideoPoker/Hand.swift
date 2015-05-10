//
//  Hand.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class Hand: Printable, SequenceType {
    private var cardList: CardList
    
    init(cardList: CardList) {
        self.cardList = cardList
    }
    
    convenience init(cards: Card...) {
        self.init(cardList: CardList(cards: cards))
    }
    
    convenience init(cards: Cards...) {
        self.init(cardList: CardList(cards: cards))
    }
    
    convenience init(cards: [Card]) {
        self.init(cardList: CardList(cards: cards))
    }
    
    convenience init(cards: [Cards]) {
        self.init(cardList: CardList(cards: cards))
    }
    
    var count: Int {
        return cardList.count
    }
    
    var isEmpty: Bool {
        return cardList.isEmpty
    }
    
    var description: String {
        return cardList.description
    }
    
    var cards: CardList {
        return cardList
    }
    
    subscript(index: Int) -> Card {
        get {
            return cardList[index]
        }
        
        set {
            cardList[index] = newValue
        }
    }
    
    func exchange(deck: Deck, exchangeArray: Array<Int>) {
        precondition(exchangeArray.count <= deck.count, "You cannot exchange more cards than are in deck")
        
        for i in exchangeArray {
            deck.discard(cardList[i])
            cardList[i] = deck.drawCard()
        }
    }
    
    func generate() -> IndexingGenerator<[Card]> {
        return cardList.generate()
    }
}