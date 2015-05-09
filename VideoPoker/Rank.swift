//
//  Rank.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

public func ==(first: Rank, second: Rank) -> Bool {
    return first.value == second.value
}

public func <(first: Rank, second: Rank) -> Bool {
    return first.value < second.value
}

public enum Rank: Int, Equatable, Comparable {
    case Two = 2
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
    case Ace
    
    public static let values: [Rank] = [
        .Ace,
        .Two,
        .Three,
        .Four,
        .Five,
        .Six,
        .Seven,
        .Eight,
        .Nine,
        .Ten,
        .Jack,
        .Queen,
        .King
    ]
    
    private static let names: [Rank: (indexValue: Int, name: String, shortName: String)] = [
        .Ace: (indexValue: 0, name: "Ace", shortName: "A"),
        .Two: (indexValue: 1, name: "Two", shortName: "2"),
        .Three: (indexValue: 2, name: "Three", shortName: "3"),
        .Four: (indexValue: 3, name: "Four", shortName: "4"),
        .Five: (indexValue: 4, name: "Five", shortName: "5"),
        .Six: (indexValue: 5, name: "Six", shortName: "6"),
        .Seven: (indexValue: 6, name: "Seven", shortName: "7"),
        .Eight: (indexValue: 7, name: "Eight", shortName: "8"),
        .Nine: (indexValue: 8, name: "Nine", shortName: "9"),
        .Ten: (indexValue: 9, name: "Ten", shortName: "T"),
        .Jack: (indexValue: 10, name: "Jack", shortName: "J"),
        .Queen: (indexValue: 11, name: "Queen", shortName: "Q"),
        .King: (indexValue: 12, name: "King", shortName: "K")
    ]
    
    public static var numberOfRanks: Int {
        return values.count
    }
    
    public static func fromIndex(index: Int) -> Rank {
        precondition(index >= 0 && index <= Rank.numberOfRanks, "Rank index out of range")
        return Rank.values[index]
    }
    
    public var description: String {
        return Rank.names[self]!.name
    }
    
    public var shortDescription: String {
        return Rank.names[self]!.shortName
    }
    
    public var value: Int {
        return rawValue
    }
    
    public var indexValue: Int {
        return Rank.names[self]!.indexValue
    }
    
}