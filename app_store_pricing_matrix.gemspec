# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "app_store_pricing_matrix"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kenn Ejima", "Elliot Bowes"]
  s.date = "2011-11-22"
  s.description = "A simple module that holds currencies and prices from the Apple's iOS App Store."
  s.email = "kenn.ejima@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "app_store_pricing_matrix.gemspec",
    "lib/app_store_pricing_matrix.rb",
    "lib/prices/aud",
    "lib/prices/aud_pro",
    "lib/prices/cad",
    "lib/prices/cad_pro",
    "lib/prices/chf",
    "lib/prices/chf_pro",
    "lib/prices/cny",
    "lib/prices/cny_pro",
    "lib/prices/dkk",
    "lib/prices/eur",
    "lib/prices/eur_pro",
    "lib/prices/gbp",
    "lib/prices/gbp_pro",
    "lib/prices/jpy",
    "lib/prices/jpy_pro",
    "lib/prices/mxn",
    "lib/prices/mxn_pro",
    "lib/prices/nok",
    "lib/prices/nok_pro",
    "lib/prices/nzd",
    "lib/prices/nzd_pro",
    "lib/prices/sek",
    "lib/prices/usd",
    "lib/prices/usd_pro",
    "spec/app_store_pricing_matrix_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/kenn/app_store_pricing_matrix"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Constants for App Store Pricing Matrix"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

