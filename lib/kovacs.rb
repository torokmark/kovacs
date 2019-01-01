require "kovacs/configuration"
require "kovacs/generator"

module Kovacs

  def self.config
    @config ||= Configuration.new
    yield(@config)
    Generator.new(@config)
  end

end
