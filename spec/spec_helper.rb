require 'yaml'

Bundler.require :default

root = File.expand_path(File.dirname(__FILE__) + '/..')
require File.join root, 'lib/purger'

Mustache.template_path = File.join root, 'templates'
