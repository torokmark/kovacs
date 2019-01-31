require 'kovacs/resources'

module Kovacs::MiddleName
  extend self

  def generate(name, sex)
    Kovacs::Forename.generate(name, sex)
  end
end
