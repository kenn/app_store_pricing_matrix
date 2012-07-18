# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Kenn Ejima", "Elliot Bowes"]
  gem.email         = ["kenn.ejima@gmail.com"]
  gem.description   = %q{A simple module that holds currencies and prices from the Apple's iOS App Store.}
  gem.summary       = %q{Constants for App Store Pricing Matrix}
  gem.homepage      = "http://github.com/kenn/app_store_pricing_matrix"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "app_store_pricing_matrix"
  gem.require_paths = ["lib"]
  gem.version       = '2.0.0' # retrieve this value by: Gem.loaded_specs['app_store_pricing_matrix'].version.to_s

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "bundler"

  # For Travis
  gem.add_development_dependency "rake"
end
