Pod::Spec.new do |s|

  s.name = 'NetworkingKit'
  s.version = '1.0.2'
  s.summary = 'A small wrapper around NSURLSession for iOS.'
  s.homepage = 'https://github.com/ccrazy88/networking-kit'
  s.author = { 'Chrisna Aing' => 'chrisna@chrisna.org' }
  s.source = { :git => 'https://github.com/ccrazy88/networking-kit.git',
               :tag => s.version.to_s }
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.frameworks = 'Foundation'
  s.requires_arc = true
  s.source_files = 'Sources/NetworkingKit/**/*.{h,m,swift}'

end
