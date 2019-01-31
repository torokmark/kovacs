require 'kovacs/configuration'

module Kovacs::Configurator
  def config
    config = Kovacs::Configuration.new
    yield(config)
    Kovacs::Generators::Person.new(config)
  end
end
