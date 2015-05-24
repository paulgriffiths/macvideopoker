//
//  Suit.swift
//
//  Enumeration of playing card suits.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

public func ==(first: Suit, second: Suit) -> Bool {
    return first.rawValue == second.rawValue
}

public enum Suit: Int, Equatable, Printable {
    case Clubs = 0
    case Hearts
    case Spades
    case Diamonds
    
    public static let values: [Suit] = [
        .Clubs,
        .Hearts,
        .Spades,
        .Diamonds
    ]
    
    private static let names: [Suit: (name: String, shortName: String)] = [
        .Clubs: (name: "Clubs", shortName: "C"),
        .Hearts: (name: "Hearts", shortName: "H"),
        .Spades: (name: "Spades", shortName: "S"),
        .Diamonds: (name: "Diamonds", shortName: "D")
    ]

    public static var numberOfSuits: Int {
        return values.count
    }
    
    public static func fromIndex(index: Int) -> Suit {
        precondition(index >= 0 && index <= numberOfSuits, "Suit index out of range")
        return Suit.values[index]
    }
    
    public var description: String {
        return Suit.names[self]!.name
    }
    
    public var shortDescription: String {
        return Suit.names[self]!.shortName
    }
    
    public var indexValue: Int {
        return rawValue
    }
    
}
