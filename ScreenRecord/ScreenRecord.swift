//
//  ScreenRecord.swift
//  ScreenRecord
//
//  Created by Xue Yu on 8/17/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import AVFoundation

public func recordScreen(destination: URL, displayId: CGDirectDisplayID, cropRect: CGRect?, audioDevice: AVCaptureDevice?) throws -> Recorder {
    return try Recorder.init(destination: destination, displayId: displayId, cropRect: cropRect, audioDevice: audioDevice)
}

public func recordScreen(destination: URL) throws -> Recorder{
    return try Recorder.init(destination: destination, displayId: CGMainDisplayID(), cropRect: nil, audioDevice: nil)
}




public enum RecorderError : String,Error {
    case invalidDisplay = "The display id passed in is invalid"
    case invalidAudioDevice = "The audio device is invalid"
    case couldNotAddScreen = "Could not add screen to input"
    case couldNotAddMic = "Could not mic to input"
    case couldNotAddOutput = "Could not add output"
}


public class Recorder: NSObject {
    private let destination: URL
    private let session: AVCaptureSession
    private let output: AVCaptureMovieFileOutput
    
    
    
    public init(destination: URL, displayId: CGDirectDisplayID, cropRect: CGRect?, audioDevice: AVCaptureDevice?) throws {
        
        self.destination = destination
        session = AVCaptureSession()
        
        guard let input = AVCaptureScreenInput.init(displayID: displayId) else {
            throw RecorderError.invalidDisplay
        }
        
        if let cropRect = cropRect {
            input.cropRect = cropRect
        }
        
        
        output = AVCaptureMovieFileOutput()
        output.movieFragmentInterval = kCMTimeInvalid
        
        if let audioDevice = audioDevice {
            if !audioDevice.hasMediaType(AVMediaTypeAudio) {
                throw RecorderError.invalidAudioDevice
            }
            
            let audioInput = try AVCaptureDeviceInput(device: audioDevice)
            
            if session.canAddInput(audioInput) {
                session.addInput(audioInput)
            } else {
                throw RecorderError.couldNotAddMic
            }
        }
        
        
        if session.canAddInput(input) {
            session.addInput(input)
        } else {
            throw RecorderError.couldNotAddScreen
        }
        
        if session.canAddOutput(output) {
            session.addOutput(output)
        } else {
            throw RecorderError.couldNotAddOutput
        }
    }
    
    public func start()  {
        session.startRunning()
        output.startRecording(toOutputFileURL: destination, recordingDelegate: self)
    }
    
    public func pause() {
        output.pauseRecording()
    }
    
    public func resume() {
        output.resumeRecording()
    }
    
    public func stop() {
        output.stopRecording()
        session.stopRunning()
    }
    
}


extension Recorder: AVCaptureFileOutputRecordingDelegate {
    
    public func capture(_ captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAt fileURL: URL!, fromConnections connections: [Any]!) {
    }
    
    public func capture(_ captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAt outputFileURL: URL!, fromConnections connections: [Any]!, error: Error!) {
    }
}

