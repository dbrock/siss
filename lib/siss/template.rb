require "siss"
require "siss/extractor"
require "tilt"
require "json"

class Siss::SassTemplate < ::Tilt::SassTemplate
  self.default_mime_type = "application/json"

  class << self
    attr_accessor :sass_options
  end

  def options
    self.class.sass_options
  end

  def prepare
    @extractor = Siss::Extractor.new(sass_options)
  end

  def evaluate(scope, locals, &block)
    @output ||= @extractor.from_string(data).to_json
  end
end
