# ScreenRecord  


![language swift ](https://img.shields.io/badge/language-swift-orange.svg) 
![GitHub license](https://img.shields.io/cocoapods/l/ScreenRecord.svg?style=flat)
![](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)




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
