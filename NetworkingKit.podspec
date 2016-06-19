Pod::Spec.new do |s|

  s.name = 'NetworkingKit'
  s.version = '0.0.1'
  s.summary = 'A small wrapper around NSURLSession for iOS'
  s.homepage = 'https://github.com/ccrazy88/networking-kit'
  s.author = { 'Chrisna Aing' => 'chrisna@chrisna.org' }
  s.source = { :git => 'https://github.com/ccrazy88/networking-kit.git',
               :tag => s.version.to_s }
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.platform = :ios, '8.0'
  s.frameworks = 'Foundation'

  s.source_files = 'Sources/NetworkingKit/**/*.{h,m,swift}'

end
