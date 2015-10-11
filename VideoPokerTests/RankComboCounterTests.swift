//
//  RankComboCounterTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class RankComboCounterTests: XCTestCase {
    
    let counter: RankComboCounter = RankComboCounter(rankCounter: RankCounter(cardList: CardList(cards: Cards.ThreeClubs.card,
        Cards.FiveHearts.card, Cards.FiveDiamonds.card, Cards.SixSpades.card, Cards.SixHearts.card, Cards.NineHearts.card,
        Cards.NineClubs.card, Cards.NineSpades.card, Cards.JackDiamonds.card, Cards.QueenSpades.card,
        Cards.KingDiamonds.card, Cards.AceSpades.card, Cards.AceClubs.card)))
    
    func testNumberByCount() {
        for (index, count) in [0, 4, 3, 1, 0, 0, 0].enumerate() {
            XCTAssertEqual(count, counter.numberByCount(index))
        }
    }

    func testHasCountWhenPresent() {
        for index in 1...3 {
            XCTAssertTrue(counter.containsCount(index))
        }
    }
    
    func testHasCountWhenNotPresent() {
        for index in 4...6 {
            XCTAssertFalse(counter.containsCount(index))
        }
    }

    func testHighestByCountWhenPresent() {
        for (index, expectedRank) in [Rank.King, Rank.Ace, Rank.Nine].enumerate() {
            if let rank = counter.highestByCount(index + 1) {
                XCTAssertEqual(expectedRank, rank)
            }
            else {
                XCTFail("expected rank count not found")
            }
        }
    }
    
    func testHighestByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.highestByCount(index) != nil {
                XCTFail("rank found when not expected")
            }
        }
    }
    
    func testSecondHighestByCountWhenPresent() {
        for (index, expectedRank) in [Rank.Queen, Rank.Six].enumerate() {
            if let rank = counter.secondHighestByCount(index + 1) {
                XCTAssertEqual(expectedRank, rank)
            }
            else {
                XCTFail("expected rank count not found")
            }
        }
    }
    
    func testSecondHighestByCountWhenNotPresent() {
        for index in 3...6 {
            if counter.secondHighestByCount(index) != nil {
                XCTFail("rank found when not expected")
            }
        }
    }
    
    func testLowestByCountWhenPresent() {
        for (index, expectedRank) in [Rank.Three, Rank.Five, Rank.Nine].enumerate() {
            if let rank = counter.lowestByCount(index + 1) {
                XCTAssertEqual(expectedRank, rank)
            }
            else {
                XCTFail("expected rank count not found")
            }
        }
    }
    
    func testLowestByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.lowestByCount(index) != nil {
                XCTFail("rank found when not expected")
            }
        }
    }
    
    func testRangeByCountWhenPresent() {
        for (index, expectedRange) in [13 - 3, 14 - 5, 9 - 9].enumerate() {
            if let range = counter.rangeByCount(index + 1) {
                XCTAssertEqual(expectedRange, range)
            }
            else {
                XCTFail("expected range not found")
            }
        }
    }
    
    func testRangeByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.rangeByCount(index) != nil {
                XCTFail("range found when not expected")
            }
        }
    }
    
    func testScoreByCountWhenPresent() {
        func sCmpt(rank: Rank, index: Int) -> Int {
            return rank.value * Int(pow(Double(Rank.numberOfRanks), Double(index)))
        }
        
        let expectedScores = [
            (sCmpt(Rank.King, index: 3) + sCmpt(Rank.Queen, index: 2) + sCmpt(Rank.Jack, index: 1) + sCmpt(Rank.Three, index: 0)),
            (sCmpt(Rank.Ace, index: 2) + sCmpt(Rank.Six, index: 1) + sCmpt(Rank.Five, index: 0)),
            (sCmpt(Rank.Nine, index: 0))
        ]
        
        for (index, expectedScore) in expectedScores.enumerate() {
            if let score = counter.scoreByCount(index + 1) {
                XCTAssertEqual(expectedScore, score)
            }
            else {
                XCTFail("expected score not found")
            }
        }
    }
    
    func testScoreByCountWhenNotPresent() {
        for index in 4...6 {
            if counter.scoreByCount(index) != nil {
                XCTFail("score found when not expected")
            }
        }
    }
}
