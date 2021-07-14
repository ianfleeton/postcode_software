Gem::Specification.new do |s|
  s.name        = 'postcode_software'
  s.version     = '0.0.3'
  s.summary     = 'Postcode Software'
  s.description = "Ruby wrapper for PostcodeSoftware's web SDK, see https://web.postcodesoftware.com/sdk"
  s.authors     = ["Ian Fleeton"]
  s.email       = 'ianfleeton@gmail.com'
  s.files       = Dir['{lib,spec}/**/*', 'LICENSE', 'Rakefile', 'README.rdoc'] & `git ls-files -z`.split("\0")
  s.homepage    =
  'https://rubygems.org/gems/postcode_software'
  s.license       = 'MIT'

  s.add_dependency 'nokogiri', '~> 1.6'

  s.add_development_dependency 'rake', '~> 12.0', '>= 12.0.0'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_development_dependency 'sinatra', '~> 1.4'
  s.add_development_dependency 'webmock', '~> 3.0'
end
