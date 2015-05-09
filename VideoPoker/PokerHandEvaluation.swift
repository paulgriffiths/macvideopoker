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
    
    var handType: PokerHands {
        return score.handType
    }
    
    init(hand: PokerHand) {
        score = PokerHandScore(counter: CardCounter(hand: hand))
    }
    
    var description: String {
        return handType.description
    }
}