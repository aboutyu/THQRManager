
Pod::Spec.new do |spec|

  spec.name             = "THQRManager"
  spec.version          = "1.0.0"
  spec.summary          = "Super Easy QR Scanner and QR Image Generate."
  spec.description      = "This is Super Easy QR Scanner and QR Image Generate."
  spec.homepage         = "https://github.com/aboutyu/THDissolveBanner"
  spec.license          = { :type => "MIT", :file => "LICENSE" }
  spec.author           = { "James" => "aboutyu@gmail.com" }
  spec.platform         = :ios, "11.0"
  spec.swift_version    = '5.0'
  spec.swift_version    = spec.swift_version.to_s
  spec.source           = { :git => "https://github.com/aboutyu/THQRManager.git", :tag => spec.version }
  spec.source_files     = "THQRManager/THQRManager/Modules/*.swift"

end
