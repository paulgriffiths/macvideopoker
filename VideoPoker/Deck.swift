//
//  Deck.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/10/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class Deck {
    private var store: CardList
    private var discardPile: CardList
    
    var count: Int {
        return store.count
    }
    
    var discardsCount: Int {
        return discardPile.count
    }
    
    var isEmpty: Bool {
        return store.isEmpty
    }
    
    init() {
        discardPile = CardList()
        store = CardList()
        for i in 0...51 {
            store.append(Card(index: i))
        }
    }
    
    func drawCard() -> Card {
        precondition(!isEmpty, "Cannot draw from empty deck")
        return store.removeLast()
    }
    
    func drawCards(numCards: Int) -> CardList {
        precondition(numCards > 0, "Number of cards to draw must be positive")
        precondition(numCards < store.count, "Cannot draw more cards then there are in the store")
        
        var list = CardList()
        for i in 1...numCards {
            list.append(store.removeLast())
        }
        return list
    }
    
    func add(card: Card) {
        store.append(card)
    }
    
    func add(cardList: CardList) {
        store.append(cardList)
    }
    
    func add(hand: Hand) {
        add(hand.cards)
    }
    
    func discard(card: Card) {
        discardPile.append(card)
    }
    
    func discard(cardList: CardList) {
        discardPile.append(cardList)
    }
    
    func discard(hand: Hand) {
        discard(hand.cards)
    }
    
    func replaceDiscardsAndShuffle() {
        replaceDiscards()
        shuffle()
    }
    
    func replaceDiscards() {
        store.append(discardPile)
        discardPile.clear()
    }
    
    func shuffle() {
        store.shuffle()
    }
}
