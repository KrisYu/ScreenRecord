//
//  WindowController.swift
//  ScreenRecord
//
//  Created by Xue Yu on 8/18/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import Cocoa
class WindowController: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        let window = self.window!
        
        window.isOpaque = false
        window.backgroundColor = NSColor.clear
        
        window.contentView?.wantsLayer = true
        window.contentView?.layer?.borderColor = NSColor.gray.cgColor
        window.contentView?.layer?.borderWidth = 2
        
    }
    
    

}
