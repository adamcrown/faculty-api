ENV['RACK_ENV'] ||= ENV['RAILS_ENV'] || 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

require_relative '../lib/faculty_api'
FacultyAPI.initialize!
