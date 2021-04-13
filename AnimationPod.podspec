Pod::Spec.new do |spec|


  spec.platform     = :ios
  spec.ios.deployment_target = '12.0'
  spec.name         = "AnimationPod"
  spec.version      = "0.0.4"
  spec.summary      = "It gives you a list of animations and performs it accordingly."


  spec.homepage     = "https://github.com/jainhrishbha/AnimationPod"
 
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "Hrishbha Jain" => "hrishbhajain@magenative.com" }


  spec.source       = { :git => "https://github.com/jainhrishbha/AnimationPod.git", :tag => "0.0.4" }
  
  spec.static_framework = true
  spec.framework = "UIKit"
  spec.dependency 'ShimmerSwift'
  


  spec.source_files  = "AnimationPod/**/*.{h,m,swift}"
  
  spec.swift_version = "5.0"
  
  spec.requires_arc = true
  

end

