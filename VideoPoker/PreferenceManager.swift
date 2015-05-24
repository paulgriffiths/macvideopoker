//
//  PreferenceManager.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/24/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Foundation

class PreferenceManager {
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    private let difficultyKey = "difficulty"
    
    var easyDifficulty: Bool {
        get {
            return userDefaults.boolForKey(difficultyKey)
        }
        
        set (easy) {
            userDefaults.setBool(easy, forKey: difficultyKey)
        }
    }
    
    init() {
        registerDefaultPreferences()
    }
    
    func registerDefaultPreferences() {
        let defaults = [difficultyKey: true]
        userDefaults.registerDefaults(defaults)
    }
}