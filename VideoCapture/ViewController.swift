//
//  ViewController.swift
//  VideoCapture
//
//  Created by Xue Yu on 8/18/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import Cocoa
import ScreenRecord
import AVFoundation

class ViewController: NSViewController {
    

    
    @IBOutlet weak var bottomBox: NSBox!
    @IBOutlet weak var recordButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var soundButton: NSButton!

    var recorder: ScreenRecord.Recorder?
    var url: URL?
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH.mm.ss"
        return formatter
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
    }
    
    func setup() {
        stopButton.isEnabled = false
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func recordFrame() -> CGRect {
        guard let window = view.window else {
            return view.frame
        }
        print(window.frame)
        
        let lineWidth: CGFloat = 2
        let titleHeight: CGFloat = 12
        
        // cropRect The origin (0,0) is the bottom-left corner of the screen.
        return CGRect(x: window.frame.origin.x + lineWidth,
                      y: window.frame.origin.y + bottomBox.frame.size.height,
                      width: view.frame.size.width - lineWidth * 2,
                      height: view.frame.size.height - titleHeight - 2 * lineWidth)
    }
    
    
    func toggleRecordButton(enabled: Bool) {
        recordButton.isEnabled = enabled
        (NSApplication.shared().delegate as! AppDelegate).recordMenuItem.isEnabled = enabled
    }
    
    func toggleStopButton(enabled: Bool) {
        stopButton.isEnabled = enabled
        (NSApplication.shared().delegate as! AppDelegate).stopMenuItem.isEnabled = enabled
    }
    
    
    @IBAction func recordButtonTouched(_ sender: NSButton) {
        
        
        soundButton.isEnabled = false
        view.window?.toggleMoving(enabled: false)
        toggleStopButton(enabled: true)
        print(soundButton.state)
        
        let soundInput: AVCaptureDevice?  = soundButton.state == 0 ? nil : .defaultDevice(withMediaType: AVMediaTypeAudio)
        
        let fileName = formatter.string(from: Date())
        
        url = URL.init(fileURLWithPath: NSHomeDirectory())
            .appendingPathComponent("Desktop")
            .appendingPathComponent(fileName)
            .appendingPathExtension("mov")
        
        do {
            // test for errors
            recorder = try ScreenRecord.Recorder(destination: url!, displayId: CGMainDisplayID(), cropRect: recordFrame(), audioDevice: soundInput)
        } catch let error as RecorderError {
            print(error.rawValue)
        } catch let error{
            print(error)
        }
        
        recorder?.start()
        
        toggleRecordButton(enabled: false)
        
        
    }
    
    
    @IBAction func stopButtonTouched(_ sender: NSButton) {
        recorder?.stop()
        
        guard let url = url else {
            return
        }
        showNotification(url: url)
        view.window?.toggleMoving(enabled: true)
        soundButton.isEnabled = true
        toggleRecordButton(enabled: true)
        toggleStopButton(enabled: false)
        
    }
    
    func showNotification(url: URL){
        let notification = NSUserNotification()
        notification.title = "VideoCapture"
        notification.informativeText = url.absoluteString
        notification.hasActionButton = true
        notification.actionButtonTitle = "Open"
        
        NSUserNotificationCenter.default.deliver(notification)
    }
    

    


}

