//
//  PreferenceManager.swift
//
//  Class for managing user defaults.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

import Foundation

private let defaultPot = 100
private let defaultBet = 5

class PreferenceManager {
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    private let difficultyKey = "difficulty"
    private let potKey = "pot"
    private let betKey = "bet"
    
    var easyDifficulty: Bool {
        get {
            return userDefaults.boolForKey(difficultyKey)
        }
        
        set (easy) {
            userDefaults.setBool(easy, forKey: difficultyKey)
        }
    }
    
    var pot: Int {
        get {
            return userDefaults.integerForKey(potKey)
        }
        
        set (value) {
            userDefaults.setInteger(value, forKey: potKey)
        }
    }
    
    var bet: Int {
        get {
            return userDefaults.integerForKey(betKey)
        }
        
        set (value) {
            userDefaults.setInteger(value, forKey: betKey)
        }
    }
    
    init() {
        registerDefaultPreferences()
    }
    
    func registerDefaultPreferences() {
        let defaults: [String: AnyObject] = [difficultyKey: true, potKey: defaultPot, betKey: defaultBet]
        userDefaults.registerDefaults(defaults)
    }
    
    func resetBetAndPot() {
        pot = defaultPot
        bet = defaultBet
    }
}