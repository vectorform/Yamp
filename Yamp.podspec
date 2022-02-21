Pod::Spec.new do |s|
  s.name             = 'Yamp'
  s.version          = '0.0.3'
  s.summary          = 'Yet Another MVP Pod'

  s.description      = <<-DESC
Yamp's goal is to make craetion of a new MVP-Centri Project easier overall, by providing the base functionality common in MVP projects.
DESC

  s.homepage         = 'https://github.com/vectorform/Yamp'
  s.license          = { :type => 'BSD', :file => 'LICENSE' }
  s.author           = { 'Vectorform' => 'jmeador@vectorform.com', 'Josh Parmentor' => 'jparmentor@vectorform.com' }
  s.source           = { :git => 'https://github.com/vectorform/Yamp.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/vectorform'
  s.swift_versions   = ['5.0']

  s.ios.deployment_target = '13.0'

  s.source_files = 'Yamp/Yamp/Source/Data/*.swift', 'Yamp/Yamp/Source/Util/*.swift', 'Yamp/Yamp/Source/Base/*.swift', 'Yamp/Yamp/Source/Base/Interfaces/*.swift'

  s.dependency 'Yarp'
end
