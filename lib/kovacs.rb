require "kovacs/configurator"
require "kovacs/generators"

module Kovacs
  extend Kovacs::Configurator
  extend Kovacs::Generators

  def self.root
    File.dirname __dir__
  end
end
