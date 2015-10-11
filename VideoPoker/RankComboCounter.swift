//
//  RankComboCounter.swift
//
//  Utility struct to calculate the numbers of quantities of ranks
//  in a list of playing cards, and associated information, for
//  instance to determine how many pairs or threes-of-a-kind are
//  present in the list, or to determine the rank of the highest
//  single card, or of the highest pair.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

struct RankComboCounter {
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
            return count.sort().last
        }
        else {
            return nil
        }
    }
    
    func secondHighestByCount(comboCount: Int) -> Rank? {
        if let count = counts[comboCount] {
            let sortedRanks = count.sort()
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
            return count.sort().first
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
            return Array(count.sort().reverse()).reduce(0, combine: {$0! * Rank.numberOfRanks + $1.value})
        }
        else {
            return nil
        }
    }
}
