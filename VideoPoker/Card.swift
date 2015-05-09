//
//  Card.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

public func ==(first: Card, second: Card) -> Bool {
    return first.index == second.index
}

public class Card: Equatable, Printable {
    let rank: Rank
    let suit: Suit
    let index: Int
    
    public var description: String {
        return "\(rank.description) of \(suit.description)"
    }
    
    public var shortDescription: String {
        return "\(rank.shortDescription)\(suit.shortDescription)"
    }
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.index = self.rank.indexValue + self.suit.indexValue * Rank.numberOfRanks
    }
    
    init(index: Int) {
        self.index = index
        self.rank = Rank.fromIndex(self.index % Rank.numberOfRanks)
        self.suit = Suit.fromIndex(self.index / Rank.numberOfRanks)
    }
}