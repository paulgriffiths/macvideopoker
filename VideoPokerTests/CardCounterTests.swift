//
//  CardCounterTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class CardCounterTests: XCTestCase {

    let counter = CardCounter(cardList: CardList(cards: Cards.ThreeClubs.card,
        Cards.FiveHearts.card, Cards.FiveDiamonds.card, Cards.SixSpades.card, Cards.SixHearts.card, Cards.NineHearts.card,
        Cards.NineClubs.card, Cards.NineSpades.card, Cards.JackDiamonds.card, Cards.QueenSpades.card,
        Cards.KingDiamonds.card, Cards.AceSpades.card, Cards.AceClubs.card))
    
    
    func testCountForRank() {
        XCTAssertEqual(2, counter.countForRank(.Ace))
        XCTAssertEqual(0, counter.countForRank(.Two))
        XCTAssertEqual(1, counter.countForRank(.Three))
        XCTAssertEqual(0, counter.countForRank(.Four))
        XCTAssertEqual(2, counter.countForRank(.Five))
        XCTAssertEqual(2, counter.countForRank(.Six))
        XCTAssertEqual(0, counter.countForRank(.Seven))
        XCTAssertEqual(0, counter.countForRank(.Eight))
        XCTAssertEqual(3, counter.countForRank(.Nine))
        XCTAssertEqual(0, counter.countForRank(.Ten))
        XCTAssertEqual(1, counter.countForRank(.Jack))
        XCTAssertEqual(1, counter.countForRank(.Queen))
        XCTAssertEqual(1, counter.countForRank(.King))
    }
    
    func testContainsRank() {
        XCTAssertTrue(counter.containsRank(.Ace))
        XCTAssertFalse(counter.containsRank(.Two))
        XCTAssertTrue(counter.containsRank(.Three))
        XCTAssertFalse(counter.containsRank(.Four))
        XCTAssertTrue(counter.containsRank(.Five))
        XCTAssertTrue(counter.containsRank(.Six))
        XCTAssertFalse(counter.containsRank(.Seven))
        XCTAssertFalse(counter.containsRank(.Eight))
        XCTAssertTrue(counter.containsRank(.Nine))
        XCTAssertFalse(counter.containsRank(.Ten))
        XCTAssertTrue(counter.containsRank(.Jack))
        XCTAssertTrue(counter.containsRank(.Queen))
        XCTAssertTrue(counter.containsRank(.King))
    }
    
    func testNumRanks() {
        XCTAssertEqual(8, counter.numRanks)
    }

    func testCountForSuit() {
        XCTAssertEqual(3, counter.countForSuit(.Clubs))
        XCTAssertEqual(3, counter.countForSuit(.Hearts))
        XCTAssertEqual(4, counter.countForSuit(.Spades))
        XCTAssertEqual(3, counter.countForSuit(.Diamonds))
    }
    
    func testContainsSuit() {
        XCTAssertTrue(counter.containsSuit(.Clubs))
        XCTAssertTrue(counter.containsSuit(.Hearts))
        XCTAssertTrue(counter.containsSuit(.Spades))
        XCTAssertTrue(counter.containsSuit(.Diamonds))
    }
    
    func testNumSuits() {
        XCTAssertEqual(4, counter.numSuits)
    }

    func testNumberRankByCount() {
        for (index, count) in [0, 4, 3, 1, 0, 0, 0].enumerate() {
            XCTAssertEqual(count, counter.numberRankByCount(index))
        }
    }
    
    func testHasRankCountWhenPresent() {
        for index in 1...3 {
            XCTAssertTrue(counter.containsRankCount(index))
        }
    }
    
    func testHasRankCountWhenNotPresent() {
        for index in 4...6 {
            XCTAssertFalse(counter.containsRankCount(index))
        }
    }
    
    func testHighestRankByCountWhenPresent() {
        for (index, expectedRank) in [Rank.King, Rank.Ace, Rank.Nine].enumerate() {
            if let rank = counter.highestRankByCount(index + 1) {
                XCTAssertEqual(expectedRank, rank)
            }
            else {
                XCTFail("expected rank count not found")
            }
        }
    }
    
    func testHighestRankByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.highestRankByCount(index) != nil {
                XCTFail("rank found when not expected")
            }
        }
    }
    
    func testSecondHighestRankByCountWhenPresent() {
        for (index, expectedRank) in [Rank.Queen, Rank.Six].enumerate() {
            if let rank = counter.secondHighestRankByCount(index + 1) {
                XCTAssertEqual(expectedRank, rank)
            }
            else {
                XCTFail("expected rank count not found")
            }
        }
    }
    
    func testSecondHighestRankByCountWhenNotPresent() {
        for index in 3...6 {
            if counter.secondHighestRankByCount(index) != nil {
                XCTFail("rank found when not expected")
            }
        }
    }
    
    func testLowestRankByCountWhenPresent() {
        for (index, expectedRank) in [Rank.Three, Rank.Five, Rank.Nine].enumerate() {
            if let rank = counter.lowestRankByCount(index + 1) {
                XCTAssertEqual(expectedRank, rank)
            }
            else {
                XCTFail("expected rank count not found")
            }
        }
    }
    
    func testLowestRankByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.lowestRankByCount(index) != nil {
                XCTFail("rank found when not expected")
            }
        }
    }
    
    func testRankRangeByCountWhenPresent() {
        for (index, expectedRange) in [13 - 3, 14 - 5, 9 - 9].enumerate() {
            if let range = counter.rankRangeByCount(index + 1) {
                XCTAssertEqual(expectedRange, range)
            }
            else {
                XCTFail("expected range not found")
            }
        }
    }
    
    func testRankRangeByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.rankRangeByCount(index) != nil {
                XCTFail("range found when not expected")
            }
        }
    }
    
    func testRankScoreByCountWhenPresent() {
        func sCmpt(rank: Rank, index: Int) -> Int {
            return rank.value * Int(pow(Double(Rank.numberOfRanks), Double(index)))
        }
        
        let expectedScores = [
            (sCmpt(Rank.King, index: 3) + sCmpt(Rank.Queen, index: 2) + sCmpt(Rank.Jack, index: 1) + sCmpt(Rank.Three, index: 0)),
            (sCmpt(Rank.Ace, index: 2) + sCmpt(Rank.Six, index: 1) + sCmpt(Rank.Five, index: 0)),
            (sCmpt(Rank.Nine, index: 0))
        ]
        
        for (index, expectedScore) in expectedScores.enumerate() {
            if let score = counter.rankScoreByCount(index + 1) {
                XCTAssertEqual(expectedScore, score)
            }
            else {
                XCTFail("expected score not found")
            }
        }
    }
    
    func testRankScoreByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.rankScoreByCount(index) != nil {
                XCTFail("score found when not expected")
            }
        }
    }
    
    func testNoCardsNotStraight() {
        let sc = CardCounter(cardList: CardList())
        XCTAssertFalse(sc.isStraight)
    }
    
    func testOneCardStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.NineDiamonds))
        XCTAssertTrue(sc.isStraight)
    }
    
    func testTwoCardStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.SevenClubs, Cards.EightDiamonds))
        XCTAssertTrue(sc.isStraight)
    }
    
    func testTwoCardNotStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.SevenClubs, Cards.NineDiamonds))
        XCTAssertFalse(sc.isStraight)
    }
    
    func testTwoCardWheelStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.AceHearts, Cards.TwoSpades))
        XCTAssertTrue(sc.isStraight)
    }
    
    func testTwoCardNotWheelStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.AceHearts, Cards.ThreeSpades))
        XCTAssertFalse(sc.isStraight)
    }
    
    func testThreeCardStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.SevenClubs, Cards.EightDiamonds, Cards.NineSpades))
        XCTAssertTrue(sc.isStraight)
    }
    
    func testThreeCardNotStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.SevenClubs, Cards.NineDiamonds, Cards.NineSpades))
        XCTAssertFalse(sc.isStraight)
    }
    
    func testThreeCardWheelStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.AceHearts, Cards.TwoSpades, Cards.ThreeClubs))
        XCTAssertTrue(sc.isStraight)
    }
    
    func testThreeCardNotWheelStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.AceHearts, Cards.ThreeSpades, Cards.ThreeDiamonds))
        XCTAssertFalse(sc.isStraight)
    }
    
    func testFourCardStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.SevenClubs, Cards.EightDiamonds, Cards.NineSpades, Cards.TenClubs))
        XCTAssertTrue(sc.isStraight)
    }
    
    func testFourCardWheelStraight() {
        let sc = CardCounter(cardList: CardList(cards: Cards.AceHearts, Cards.TwoSpades, Cards.ThreeClubs, Cards.FourDiamonds))
        XCTAssertTrue(sc.isStraight)
    }
    
}
