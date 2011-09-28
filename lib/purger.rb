root = File.dirname __FILE__
lib_dir = File.join root, 'purger'

require File.join lib_dir, 'data_types'
require File.join lib_dir, 'views'
require File.join lib_dir, 'akamai_adapters'
require File.join lib_dir, 'app'
