# ScreenRecord  


[![GitHub license](https://img.shields.io/github/license/nirix/swift-screencapture.svg)]() [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/ScreenCapture.svg)](https://cocoapods.org/pods/ScreenCapture)

A Swift framework to easily record the screen on OS X.

## Install
 
You can just put [ScreenRecord.swift](https://github.com/KrisYu/ScreenRecord/blob/master/ScreenRecord/ScreenRecord.swift) in your Project and use the public methods or Carthage/CocoaPods.



### Carthage

`github "KrisYu/ScreenRecord"`


### Cocoapods

`pod "ScreenRecord"`


## Demo

Download this repo and check VideoCapture.

It is a video capture app imitate [GifCaptrue](https://github.com/onmyway133/GifCapture).


![](videocapture.png) 


## QuickStart

```swift

let recorder = try? ScreenRecord.Recorder(destination: url, displayId: CGMainDisplayID(), cropRect: nil, audioDevice: nil )

recorder?.start()

recorder?.stop()
```

## Notice

`recorder.start()/stop()` use the `startRunning()/stopRunning()` function from AVCaptureSession. You need to consider it may block the UI / take some time.
