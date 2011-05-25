require 'sass-extractor'
require 'json'

module Siss
  class Rack
    def initialize(app, options)
      @app = app
      @prefix = options[:prefix] || "/"
      @extractor = SassExtractor.new \
        :sass_options => options[:sass_options],
        :prefixes => ["-siss-"]
    end
  
    def get_json(file_name)
      @extractor.get_rules(file_name).to_json
    end
  
    def call(env)
      case env['PATH_INFO']
      when /^#@prefix(.+)\.css\.js$/
        [200, { "Content-Type" => "text/javascript" }, <<"^D"]
Siss = Siss || { rules: {} }
Siss.rules["#$1"] = #{get_json("#$1.sass")}
^D
      else
        @app.call(env)
      end
    end
  end
end
