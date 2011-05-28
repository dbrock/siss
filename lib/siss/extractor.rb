require "siss"
require "sass-extractor"

class Siss::Extractor < ::SassExtractor
  PREFIX = "-siss-"

  def initialize(options)
    super :prefixes => [PREFIX],
          :sass_options => options
  end
end
