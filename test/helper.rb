require 'rubygems'
require 'test/unit'
require 'rack/test'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rack/chrome_frame'

class Test::Unit::TestCase
end
