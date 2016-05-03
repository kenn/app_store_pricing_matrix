#!/usr/bin/env rake
require "bundler/gem_tasks"

# RSpec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task :default => :spec

namespace :aspm do
  desc 'Launch browser to fetch pricing matrix JSON'
  task :open do
    require 'launchy'

    print 'App Store ID (e.g. 890664813): '
    id = STDIN.gets.strip
    Launchy.open("https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/apps/#{id}/pricing/matrix")
  end
end
