//
//  StatusMenuController.swift
//  Delta
//
//  Created by Phil on 2018-11-28.
//  Copyright © 2018 Phil. All rights reserved.
//

import Cocoa
import Foundation


var launchScript =  """
                    tell application "Notes"
                        activate
                        if not (exists folder "😬") then make new folder with properties {name:"😬"}
                        if not (exists note "𝝙" of folder "😬") then make new note at folder "😬" of account "iCloud" with properties {name:"𝝙", body:""}
                        show note "𝝙" of folder "😬"
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Window" of menu bar 1 to click menu item 5 of menu 1
                        set visible of last window to false
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Window" of menu bar 1 to click menu item 5 of menu 1
                        tell application "System Events" to key code 125 using {command down}
                    end tell
                    """

var newScript =     """
                    tell application "Notes"
                        activate
                        if not (exists folder "😬") then make new folder with properties {name:"😬"}
                        make new note at folder "😬" of account "iCloud" with properties {name:"✨", body:""}
                        show note "✨" of folder "😬"
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Window" of menu bar 1 to click menu item 5 of menu 1
                        set visible of last window to false
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Window" of menu bar 1 to click menu item 5 of menu 1
                        tell application "System Events" to key code 125
                    end tell
                    """

var pasteScript =   """
                    tell application "Notes"
                        activate
                        if not (exists folder "😬") then make new folder with properties {name:"😬"}
                        make new note at folder "😬" of account "iCloud" with properties {name:"📋", body:""}
                        show note "📋" of folder "😬"
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Window" of menu bar 1 to click menu item 5 of menu 1
                        set visible of last window to false
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Window" of menu bar 1 to click menu item 5 of menu 1
                        tell application "System Events" to key code 125
                        tell application "System Events" to tell process ("Notes") to tell menu bar item "Edit" of menu bar 1 to click menu item "Paste" of menu 1
                    end tell
                    """

var searchScript =  """
                    tell application "Notes"
                        activate
                        set visible of last window to true
                        tell application "System Events" to keystroke "0" using {command down}
                        tell application "System Events" to keystroke "f" using {command down, option down}
                    end tell
                    """

var floatScript =   """

                    """

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    
    override func awakeFromNib() {
        statusItem.title = "𝝙"
        statusItem.menu = statusMenu
    }
    
    @IBAction func launchNotes(_ sender: NSMenuItem) {
        let script = NSAppleScript(source: launchScript)!;
        var errorDict : NSDictionary?
        script.executeAndReturnError(&errorDict)
        if errorDict != nil { print(errorDict!) }
    }
    @IBAction func newNote(_ sender: NSMenuItem) {
        let script = NSAppleScript(source: newScript)!;
        var errorDict : NSDictionary?
        script.executeAndReturnError(&errorDict)
        if errorDict != nil { print(errorDict!) }
    }
    @IBAction func pasteClip(_ sender: NSMenuItem) {
        let script = NSAppleScript(source: pasteScript)!;
        var errorDict : NSDictionary?
        script.executeAndReturnError(&errorDict)
        if errorDict != nil { print(errorDict!) }
    }
    @IBAction func searchNotes(_ sender: NSMenuItem) {
        let script = NSAppleScript(source: searchScript)!;
        var errorDict : NSDictionary?
        script.executeAndReturnError(&errorDict)
        if errorDict != nil { print(errorDict!) }
    }
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
}
