require 'helper'

class TestrackChromeFrame < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    test_app = lambda { |env|
      if env["PATH_INFO"] =~ /^\/with_header/
        [200, { 'Content-Type' => 'text/plain', 'X-UA-Compatible' => 'IE=EmulateIE7' }, 'Test App with header']
      else
        [200, { 'Content-Type' => 'text/plain' }, 'Test App']
      end
    }
    app = Rack::ChromeFrame.new(test_app)
  end

  def test_header_is_set
    get '/'
    assert_equal 'chrome=1', last_response['X-UA-Compatible']
  end

  def test_does_not_override
    get '/with_header'
    assert_equal 'IE=EmulateIE7', last_response['X-UA-Compatible']
  end

end

