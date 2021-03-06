#
#  Be sure to run `pod spec lint InsiteoCocos2D.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "InsiteoCocos2D"
  s.version      = "0.0.1"
  s.summary      = "A short description of InsiteoCocos2D."

  s.description  = <<-DESC
                   A longer description of InsiteoCocos2D in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/Insiteo/cocos2d-iphone-classic"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "bleguelvouit" => "baptiste.leguelvouit@insiteo.com" }
  # Or just: s.author    = "bleguelvouit"
  # s.authors            = { "bleguelvouit" => "baptiste.leguelvouit@insiteo.com" }
  # s.social_media_url   = "http://twitter.com/bleguelvouit"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "5.1.1"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/Insiteo/cocos2d-iphone-classic.git" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # s.source_files  = "cocos2d/**/*", "CocosDenshion/**/*", "external/**/*"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  s.frameworks = "CoreText", "CoreMotion", "CoreGraphics", "Foundation", "OpenGLES", "QuartzCore", "UIKit", "AVFoundation", "AudioToolbox", "OpenAL", "GameKit"

  # s.library   = "iconv"
  s.libraries = "z", "sqlite3"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.requires_arc = false

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/external/kazmath/include/**" }
  
  # s.dependency "JSONKit", "~> 1.4"
    
  s.subspec 'cocos2d' do |co|
    co.source_files = "cocos2d/*"
    
    co.subspec 'Platforms' do |pl|
    	pl.header_dir = "Platforms"
    	pl.source_files = "cocos2d/Platforms/*"
    
    	pl.subspec 'iOS' do |io|
  			io.header_dir = "Platforms/iOS"
    		io.source_files = "cocos2d/Platforms/iOS/*"
  		end
  		
  		pl.subspec 'Mac' do |ma|
  			ma.header_dir = "Platforms/Mac"
    		ma.source_files = "cocos2d/Platforms/Mac/*"
  		end
  	end
  	
  	co.subspec 'Support' do |su|
    	su.header_dir = "Support"
    	su.source_files = "cocos2d/Support/*"
  	end
  end
  
  s.subspec 'CocosDenshion' do |cd|
    cd.source_files = "CocosDenshion/**/*"
  end
  
  s.subspec 'external' do |ex|
    ex.subspec 'kazmath' do |ka|    	
    	ka.subspec 'src' do |sr|
    		sr.source_files = "external/kazmath/src/*.c"
    		
    		sr.subspec 'GL' do |gls|
    			gls.source_files = "external/kazmath/src/GL/*.c"
  			end
  			
  		end
  		
  		ka.subspec 'include' do |inc|  			
  			inc.subspec 'kazmath' do |ka2|
  				ka2.header_dir = "kazmath"
  				
    			ka2.source_files = "external/kazmath/include/kazmath/*.h"
    			ka2.subspec 'GL' do |glh|
  					glh.header_dir = "kazmath/GL"
    				glh.source_files = "external/kazmath/include/kazmath/GL/*.h"
  				end
  				
  			end
  			
  		end
  		
  	end
  	
  end

end
