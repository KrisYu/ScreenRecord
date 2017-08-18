Pod::Spec.new do |s|
  s.name         = "ScreenRecord"
  s.version      = "0.1.0"
  s.summary      = "Easily record screen on macOS."
  s.homepage     = "https://github.com/KrisYu/ScreenRecord"
  s.license      = "MIT"
  s.author       = "KrisYu"
  s.platform     = :osx, "10.9"
  s.source       = { :git => "https://github.com/KrisYu/ScreenRecord.git", :tag => "0.1.0" }
  s.source_files = "ScreenRecord/*.swift"
end
