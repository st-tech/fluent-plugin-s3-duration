# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-s3-duration"
  gem.description = "Amazon S3 output plugin for Fluentd event collector, with time_slice_duration"
  gem.homepage    = "https://github.com/vasilyjp/fluent-plugin-s3-duration"
  gem.summary     = gem.description
  gem.version     = File.read("VERSION").strip
  gem.authors     = ["Masaki Yoshida"]
  gem.email       = "yoshida@vasily.jp"
  gem.has_rdoc    = false
  #gem.platform    = Gem::Platform::RUBY
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency "fluent-plugin-s3"
end
