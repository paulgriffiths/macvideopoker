//
//  RankComboCounter.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/9/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

class RankComboCounter {
    private var counts: [Int : Set<Rank>] = [:]
    
    init(rankCounter: RankCounter) {
        for rank in rankCounter.ranksSet() {
            let rankCount = rankCounter.countForRank(rank)
            
            if counts[rankCount] != nil {
                counts[rankCount]!.insert(rank)
            }
            else {
                counts[rankCount] = [rank]
            }
        }
    }
    
    func numberByCount(comboCount: Int) -> Int {
        if let count = counts[comboCount] {
            return count.count
        }
        else {
            return 0
        }
    }
    
    func containsCount(comboCount: Int) -> Bool {
        if counts[comboCount] != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func highestByCount(comboCount: Int) -> Rank? {
        if let count = counts[comboCount] {
            return sorted(count).last
        }
        else {
            return nil
        }
    }
    
    func secondHighestByCount(comboCount: Int) -> Rank? {
        if let count = counts[comboCount] {
            let sortedRanks = sorted(count)
            if sortedRanks.count < 2 {
                return nil
            }
            else {
                return sortedRanks[sortedRanks.count - 2]
            }
        }
        else {
            return nil
        }
    }
    
    func lowestByCount(comboCount: Int) -> Rank? {
        if let count = counts[comboCount] {
            return sorted(count).first
        }
        else {
            return nil
        }
    }
    
    func rangeByCount(comboCount: Int) -> Int? {
        if let highest = highestByCount(comboCount)?.value, let lowest = lowestByCount(comboCount)?.value {
            return highest - lowest
        }
        else {
            return nil
        }
    }
    
    func scoreByCount(comboCount: Int) -> Int? {
        if let count = counts[comboCount] {
            return reverse(sorted(count)).reduce(0, combine: {$0! * Rank.numberOfRanks + $1.value})
        }
        else {
            return nil
        }
    }
}
