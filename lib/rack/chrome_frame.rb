module Rack

  class ChromeFrame

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      headers["X-UA-Compatible"] ||= "chrome=1"
      [status, headers, response]
    end

  end

end
