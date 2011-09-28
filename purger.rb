require 'rubygems'
require 'bundler/setup'
Bundler.require :default

require './lib/purger'
require './config/app'

Purger::App.start
