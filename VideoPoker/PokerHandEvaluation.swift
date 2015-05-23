//
//  PokerHandEvaluation.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

func ==(first: PokerHandEvaluation, second: PokerHandEvaluation) -> Bool {
    return first.score == second.score
}

func <(first: PokerHandEvaluation, second: PokerHandEvaluation) -> Bool {
    return first.score < second.score
}

struct PokerHandEvaluation: Equatable, Comparable, Printable {
    let score: PokerHandScore
    let counter: CardCounter
    
    var handType: PokerHands {
        return score.handType
    }
    
    init(hand: PokerHand) {
        counter = CardCounter(hand: hand)
        score = PokerHandScore(counter: counter)
    }
    
    var description: String {
        return handType.description
    }
    
    var topLevelRankScore: Rank {
        switch handType {
        case .StraightFlush, .Straight:
            if let highestRank = counter.highestRankByCount(1), let lowestRank = counter.lowestRankByCount(1) {
                if highestRank == .Ace && lowestRank == .Two {
                    return .Five
                }
                else {
                    return highestRank
                }
            }
            
        case .Four:
            if let highestRank = counter.highestRankByCount(4) {
                return highestRank
            }
            
        case .FullHouse, .Three:
            if let highestRank = counter.highestRankByCount(3) {
                return highestRank
            }
            
        case .RoyalFlush, .Flush, .HighCard:
            if let highestRank = counter.highestRankByCount(1) {
                return highestRank
            }
            
        case .TwoPair, .Pair:
            if let highestRank = counter.highestRankByCount(2) {
                return highestRank
            }
        }
        
        fatalError("Couldn't get top level rank score")
    }
}