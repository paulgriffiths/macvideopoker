//
//  Card.swift
//
//  Struct to represent a playing card.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

public func ==(first: Card, second: Card) -> Bool {
    return first.index == second.index
}

public struct Card: Equatable, Printable {
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