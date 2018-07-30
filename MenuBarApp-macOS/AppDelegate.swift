//
//  AppDelegate.swift
//  MenuBarApp-macOS
//
//  Created by Nobuhiro Takahashi on 2018/07/31.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AppDelegate.update), userInfo: nil, repeats: true)
        //Show statusMenu
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func update() {
        // Format the date
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "h:mm:ss"
        
        // Convert date into a string
        let now = dateformatter.string(from: NSDate() as Date)
        
        // Replace the title of the item in the status bar
        statusItem.title = "⏳"+now
    }
    
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}

