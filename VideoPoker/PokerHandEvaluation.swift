//
//  PokerHandEvaluation.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

private func calculateHandType(counter: CardCounter) -> PokerHands {
    if counter.isFlush && counter.isStraight {
        if counter.lowestRankByCount(1) == Rank.Ten {
            return .RoyalFlush
        }
        else {
            return .StraightFlush
        }
    }
    else if counter.numberRankByCount(4) == 1 {
        return .Four
    }
    else if counter.numberRankByCount(3) == 1 && counter.numberRankByCount(2) == 1 {
        return .FullHouse
    }
    else if counter.isFlush {
        return .Flush
    }
    else if counter.isStraight {
        return .Straight
    }
    else if counter.numberRankByCount(3) == 1 {
        return .Three
    }
    else if counter.numberRankByCount(2) == 2 {
        return .TwoPair
    }
    else if counter.numberRankByCount(2) == 1 {
        return .Pair
    }
    else {
        return .HighCard
    }
}

func ==(first: PokerHandEvaluation, second: PokerHandEvaluation) -> Bool {
    return first.handType == second.handType
}

func <(first: PokerHandEvaluation, second: PokerHandEvaluation) -> Bool {
    return first.handType < second.handType
}

struct PokerHandEvaluation: Equatable, Comparable, Printable {
    let handType: PokerHands
    
    init(hand: PokerHand) {
        let counter = CardCounter(hand: hand)
        handType = calculateHandType(counter)
    }
    
    var description: String {
        return handType.description
    }
}