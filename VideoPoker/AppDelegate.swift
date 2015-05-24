//
//  AppDelegate.swift
//  VideoPoker
//
//  Created by Paul Griffiths on 5/8/15.
//  Copyright (c) 2015 Paul Griffiths. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var difficultyMenu: NSMenuItem?
    @IBOutlet weak var easyMenu: NSMenuItem?
    @IBOutlet weak var normalMenu: NSMenuItem?

    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
        self.mainWindowController = mainWindowController
    }
    
    //  Terminate the app by the red button

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func easyMenuSelected(sender: NSMenuItem) {
        self.mainWindowController?.easyDifficulty = true
        sender.state = NSOnState
        normalMenu?.state = NSOffState
    }
    
    @IBAction func normalMenuSelected(sender: NSMenuItem) {
        self.mainWindowController?.easyDifficulty = false
        sender.state = NSOnState
        easyMenu?.state = NSOffState
    }

    @IBAction func newGameSelected(sender: NSMenuItem) {
        self.mainWindowController?.resetGame()
    }
}

