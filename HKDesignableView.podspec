Pod::Spec.new do |s|

  s.name         = "HKDesignableView"
  s.version      = "1.0.1"
  s.summary      = "A backbone of UIView which built on IBDesignable and IBInspectable, avaiable from XCode 6"

  s.description  = <<-DESC
                   A kind of UIView base class help you design your GUI on story board visually

                   * Feature: designable view, dragable view
                   * Tested on : iOS 7, 8, 9
                   * Supported from : XCode 6 above
                   DESC

  s.homepage     = "https://github.com/haikieu/HKDesignableView"
  s.screenshots  = "https://raw.githubusercontent.com/haikieu/HKDesignableView/1.0/Pictures/Story-board.png", "https://raw.githubusercontent.com/haikieu/HKDesignableView/1.0/Pictures/Component1.png", "https://raw.githubusercontent.com/haikieu/HKDesignableView/1.0/Pictures/Conponent2.png"

  s.license      = "MIT"

  s.author    = "Mr.Kieu"
  s.social_media_url   = "https://github.com/haikieu"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/haikieu/HKDesignableView.git", :tag => '1.0.1' }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true

end
