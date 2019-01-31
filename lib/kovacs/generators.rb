require 'ostruct'

require 'kovacs/person'
require 'kovacs/nationality'
require 'kovacs/sex'
require 'kovacs/forename'
require 'kovacs/middle_name'
require 'kovacs/surname'


module Kovacs::Generators
  def generate
    Struct.new('Config', :nationality, :sex, :forename, :middle_name, :surname)
    Person.new(Struct::Config.new).generate 
  end

  class Person
    def initialize(config)
      @config = config
    end

    def generate
      person = Kovacs::Person.new
      person.nationality = Kovacs::Nationality.generate(@config.nationality)
      person.sex         = Kovacs::Sex.generate(@config.sex)
      person.forename    = Kovacs::Forename.generate(@config.forename || person.nationality, person.sex)
      person.middle_name = Kovacs::MiddleName.generate(@config.middle_name || person.nationality, person.sex)
      person.surname     = Kovacs::Generators.surname(@config.surname || person.nationality)
      person
    end
  end

  extend self

  def nationality(nationality = nil)
    Kovacs::Nationality.generate(nationality)
  end

  def sex(sex = nil)
    Kovacs::Sex.generate(sex)
  end

  def forename(forename = nil, sex = nil)
    Kovacs::Forename.generate(forename, sex)
  end

  def middle_name(middle_name = nil, sex = nil)
    Kovacs::MiddleName.generate(middle_name, sex)
  end

  def surname(surname = nil)
    Kovacs::Surname.generate(surname)
  end



end
