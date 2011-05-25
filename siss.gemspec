Gem::Specification.new do |gem|
  gem.name = 'siss'
  gem.version = '0.0.1'
  gem.authors = ['Daniel Brockman']
  gem.email = ['daniel@gointeractive.se']
  gem.summary = 'Simple interaction style sheets'
  gem.homepage = 'http://github.com/dbrock/siss'
  gem.files = ['lib/siss/rack.rb']
  gem.add_dependency('sass-extractor', '~> 0.0.1')
  gem.add_dependency('json')
end
