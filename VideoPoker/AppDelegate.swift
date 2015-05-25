//
//  AppDelegate.swift
//
//  Application delegate class.
//
//  Copyright (c) 2015 Paul Griffiths.
//  Distributed under the terms of the GNU General Public License. <http://www.gnu.org/licenses/>
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var difficultyMenu: NSMenuItem?
    @IBOutlet weak var easyMenu: NSMenuItem?
    @IBOutlet weak var normalMenu: NSMenuItem?
    
    private var mainWindowController: MainWindowController?
    private let preferenceManager: PreferenceManager = PreferenceManager()
    
    private var easyDifficulty = true {
        didSet {
            self.mainWindowController?.easyDifficulty = easyDifficulty
            preferenceManager.easyDifficulty = easyDifficulty
            easyMenu?.state = easyDifficulty ? NSOnState : NSOffState
            normalMenu?.state = easyDifficulty ? NSOffState : NSOnState
        }
    }
    
    // MARK: - NSApplicationDelegate methods

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
        self.mainWindowController = mainWindowController
        easyDifficulty = preferenceManager.easyDifficulty
    }
    
    //  Terminate the app by the red button

    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    // MARK: - Menu actions

    @IBAction func difficultyMenuOptionChanged(sender: NSMenuItem) {
        if let easyMenu = easyMenu, normalMenu = normalMenu {
            switch sender {
            case easyMenu:
                easyDifficulty = true
                
            case normalMenu:
                easyDifficulty = false
                
            default:
                fatalError("Unrecognized difficulty menu selection")
            }
        }
    }
    
    @IBAction func newGameSelected(sender: NSMenuItem) {
        self.mainWindowController?.resetGame()
    }
}

