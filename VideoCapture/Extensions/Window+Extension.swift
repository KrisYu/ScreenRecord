//
//  Window+Extension.swift
//  ScreenRecord
//
//  Created by Xue Yu on 8/18/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import Cocoa

extension NSWindow {
    
    func toggleMoving(enabled: Bool) {
        if enabled {
            styleMask.update(with: .resizable)
            isMovable = true
            isMovableByWindowBackground = true
            level = Int(CGWindowLevelForKey(.normalWindow))
        } else {
            styleMask.remove(.resizable)
            isMovable = false
            level = Int(CGWindowLevelForKey(.floatingWindow))
        }
    }
}
