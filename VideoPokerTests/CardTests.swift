//
//  CardTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class CardTests: XCTestCase {

    func testDescription() {
        XCTAssertEqual("Ace of Clubs", Card(rank: .Ace, suit: .Clubs).description)
        XCTAssertEqual("Two of Hearts", Card(rank: .Two, suit: .Hearts).description)
        XCTAssertEqual("Three of Spades", Card(rank: .Three, suit: .Spades).description)
        XCTAssertEqual("Four of Diamonds", Card(rank: .Four, suit: .Diamonds).description)
        XCTAssertEqual("Five of Clubs", Card(rank: .Five, suit: .Clubs).description)
        XCTAssertEqual("Six of Hearts", Card(rank: .Six, suit: .Hearts).description)
        XCTAssertEqual("Seven of Spades", Card(rank: .Seven, suit: .Spades).description)
        XCTAssertEqual("Eight of Diamonds", Card(rank: .Eight, suit: .Diamonds).description)
        XCTAssertEqual("Nine of Clubs", Card(rank: .Nine, suit: .Clubs).description)
        XCTAssertEqual("Ten of Hearts", Card(rank: .Ten, suit: .Hearts).description)
        XCTAssertEqual("Jack of Spades", Card(rank: .Jack, suit: .Spades).description)
        XCTAssertEqual("Queen of Diamonds", Card(rank: .Queen, suit: .Diamonds).description)
        XCTAssertEqual("King of Clubs", Card(rank: .King, suit: .Clubs).description)
    }

    func testShortDescription() {
        XCTAssertEqual("AC", Card(rank: .Ace, suit: .Clubs).shortDescription)
        XCTAssertEqual("2H", Card(rank: .Two, suit: .Hearts).shortDescription)
        XCTAssertEqual("3S", Card(rank: .Three, suit: .Spades).shortDescription)
        XCTAssertEqual("4D", Card(rank: .Four, suit: .Diamonds).shortDescription)
        XCTAssertEqual("5C", Card(rank: .Five, suit: .Clubs).shortDescription)
        XCTAssertEqual("6H", Card(rank: .Six, suit: .Hearts).shortDescription)
        XCTAssertEqual("7S", Card(rank: .Seven, suit: .Spades).shortDescription)
        XCTAssertEqual("8D", Card(rank: .Eight, suit: .Diamonds).shortDescription)
        XCTAssertEqual("9C", Card(rank: .Nine, suit: .Clubs).shortDescription)
        XCTAssertEqual("TH", Card(rank: .Ten, suit: .Hearts).shortDescription)
        XCTAssertEqual("JS", Card(rank: .Jack, suit: .Spades).shortDescription)
        XCTAssertEqual("QD", Card(rank: .Queen, suit: .Diamonds).shortDescription)
        XCTAssertEqual("KC", Card(rank: .King, suit: .Clubs).shortDescription)
    }

}
