require "siss"
require "siss/extractor"
require "json"

class Siss::Middleware
  def initialize(app, options)
    @app = app
    @extractor = Siss::Extractor.new(options[:sass_options])
  end

  def get_siss_json(filename)
    @extractor.from_file(filename).to_json
  end

  def call(env)
    case env["PATH_INFO"]
    when /^(.+)\.siss\.json$/
      respond 200, get_siss_json("#$1.sass"),
        "Content-Type" => "application/javascript"
    else
      @app.call(env)
    end
  end

  def respond(status, body, headers)
    [status, headers, body]
  end
end
