
Pod::Spec.new do |s|
  s.name             = 'NavigationFramework'
  s.version          = '0.1.0'
  s.summary          = 'Navigation framework for decpoupled module applications'



  s.description      = 'Navigation framework for decpoupled module applications'

  s.homepage         = 'https://github.com/AlekseyNovikov/NavigationFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AlekseyNovikov' => 'novikow.ay@gmail.com' }
  s.source           = { :git => 'https://github.com/AlekseyNovikov/NavigationFramework.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Alexey247'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/**/*'
  
  end