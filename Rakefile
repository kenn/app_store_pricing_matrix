require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "app_store_pricing_matrix"
  gem.homepage = "http://github.com/kenn/app_store_pricing_matrix"
  gem.license = "MIT"
  gem.summary = "Constants for App Store Pricing Matrix"
  gem.description = "A simple module that holds currencies and prices from the Apple's iOS App Store."
  gem.email = "kenn.ejima@gmail.com"
  gem.authors = ["Kenn Ejima"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "app_store_pricing_matrix #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :aspm do
  desc "Parse PDF and generate files"
  task :generate do
    require 'pdf-reader'
    require 'pp'
    require 'yaml'
    
    receiver = PDF::Reader::RegisterReceiver.new
    pdf = PDF::Reader.file("lib/prices/v6.pdf", receiver)
    
    targets = receiver.callbacks.select{|callback| callback[:name] == :show_text }[17..-1].map{|i| i[:args].first }
    split_at = 11*86-1
    
    page1 = Hash.new{|h,k| h[k] = Array.new }.tap do |hash|
      targets.each_with_index do |v,i|
        next if i > split_at
        key = case i % 11
        when 0
          :tier
        when 1
          :usd
        when 2
          :mxn
        when 3
          :usd_pro
        when 4
          :cad
        when 5
          :cad_pro
        when 6
          :aud
        when 7
          :nzd
        when 8
          :aud_pro
        when 9
          :jpy
        when 10
          :jpy_pro
        end
        hash[key.to_s] << v unless key == :tier
      end
    end
    
    targets = targets[split_at+15..-1]
    page2 = Hash.new{|h,k| h[k] = Array.new }.tap do |hash|
      targets.each_with_index do |v,i|
        key = case i % 9
        when 0
          :tier
        when 1
          :eur
        when 2
          :dkk
        when 3
          :nok
        when 4
          :sek
        when 5
          :chf
        when 6
          :eur_pro
        when 7
          :gbp
        when 8
          :gbp_pro
        end
        hash[key.to_s] << v unless key == :tier
      end
    end
    
    whole = page1.merge(page2)
    whole.keys.each do |key|
      File.open("lib/prices/#{key}", 'w') {|file| file.write whole[key].join("\n") }
    end
  end
end
