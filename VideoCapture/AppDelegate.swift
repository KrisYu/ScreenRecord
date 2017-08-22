//
//  AppDelegate.swift
//  VideoCapture
//
//  Created by Xue Yu on 8/18/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var recordMenuItem: NSMenuItem!
    @IBOutlet weak var stopMenuItem: NSMenuItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        NSUserNotificationCenter.default.delegate = self
    
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}


extension AppDelegate: NSUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
        
        guard let text = notification.informativeText, let url = URL(string: text) else {
            return
        }
        
        NSWorkspace.shared().open(url)
    }
}
