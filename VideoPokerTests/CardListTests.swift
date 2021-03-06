//
//  CardListTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class CardListTests: XCTestCase {

    func testDefaultInitializer() {
        let list = CardList()
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(0, list.count)
    }

    func testCardInitializer() {
        let list = CardList(cards: Card(rank: .Ace, suit: .Clubs),
                                   Card(rank: .Three, suit: .Spades),
                                   Card(rank: .Queen, suit: .Diamonds))
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(3, list.count)
        XCTAssertEqual(Cards.AceClubs.card, list[0])
        XCTAssertEqual(Cards.ThreeSpades.card, list[1])
        XCTAssertEqual(Cards.QueenDiamonds.card, list[2])
        XCTAssertEqual("[AC,3S,QD]", list.description)
    }
    
    func testCardsInitializer() {
        let list = CardList(cards: Cards.FourDiamonds.card,
            Cards.SixClubs.card,
            Cards.JackHearts.card,
            Cards.KingSpades.card)
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(4, list.count)
        XCTAssertEqual(Cards.FourDiamonds.card, list[0])
        XCTAssertEqual(Cards.SixClubs.card, list[1])
        XCTAssertEqual(Cards.JackHearts.card, list[2])
        XCTAssertEqual(Cards.KingSpades.card, list[3])
        XCTAssertEqual("[4D,6C,JH,KS]", list.description)
    }
    
    func testIteration() {
        var result: String = ""
        let list = CardList(cards: Card(rank: .Ace, suit: .Clubs),
            Card(rank: .Three, suit: .Spades),
            Card(rank: .Queen, suit: .Diamonds))
        
        for card in list {
            result = result + card.shortDescription
        }
        
        XCTAssertEqual("AC3SQD", result)
    }
}
