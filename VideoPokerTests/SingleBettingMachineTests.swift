//
//  SingleBettingMachineTests.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/19/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa
import XCTest

class SingleBettingMachineTests: XCTestCase {

    func testBasicOperation() {
        let machine = SingleBettingMachine()
        XCTAssertEqual(100, machine.pot)
        XCTAssertEqual(5, machine.defaultBet)
        XCTAssertEqual(5, machine.currentBet)
        XCTAssertFalse(machine.isOutOfMoney)
        
        machine.bet(25)
        XCTAssertEqual(75, machine.pot)
        XCTAssertEqual(25, machine.currentBet)
        
        machine.win(2)
        XCTAssertEqual(125, machine.pot)
        
        machine.bet(125)
        XCTAssertEqual(0, machine.pot)
        XCTAssertEqual(125, machine.currentBet)
        XCTAssertFalse(machine.isOutOfMoney)
        
        machine.win(0)
        XCTAssertEqual(0, machine.pot)
        XCTAssertTrue(machine.isOutOfMoney)
    }
    
    func testBetOverflows() {
        let pot: Int = Int.max / 6
        let bet: Int = Int.max / 6
        let machine = SingleBettingMachine(pot: pot, defaultBet: bet)
        
        machine.bet(bet)
        let winResult = machine.win(7)
        XCTAssertTrue(winResult == nil)
    }

    func testBetDoesntOverflow() {
        let pot: Int = Int.max / 6
        let bet: Int = Int.max / 6
        let machine = SingleBettingMachine(pot: pot, defaultBet: bet)
        
        machine.bet(bet)
        let winResult = machine.win(5)
        XCTAssertFalse(winResult == nil)
    }
    
    func testPotOverflows() {
        let pot: Int = Int.max - 100
        let bet: Int = 90
        let machine = SingleBettingMachine(pot: pot, defaultBet: bet)
        
        machine.bet(bet)
        let winResult = machine.win(3)
        XCTAssertTrue(winResult == nil)
    }
    
    func testPotDoesntOverflow() {
        let pot: Int = Int.max - 100
        let bet: Int = 90
        let machine = SingleBettingMachine(pot: pot, defaultBet: bet)
        
        machine.bet(bet)
        let winResult = machine.win(2)
        XCTAssertFalse(winResult == nil)
    }
}
