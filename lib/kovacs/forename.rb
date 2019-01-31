require 'kovacs/resources'

module Kovacs::Forename
  extend self

  def generate(name, sex)
    sex = Kovacs::Sex.generate(sex)
    unless Kovacs::Sex.valid?(sex)
      raise ArgumentError.new("Wrong argument! Supposed to be :female or :male")
    end

    case name
    when NilClass
      nationalities = Kovacs::Resources.nationalities
      nationality = nationalities[rand(nationalities.size)]
      forenames = Kovacs::Resources.forenames(nationality, sex)
      forenames[rand(forenames.size)]
    when String
      name
    when Symbol
      Kovacs::Nationality.validate_symbol(name)
      forenames = Kovacs::Resources.forenames(name, sex)
      forenames[rand(forenames.size)]
    when Array
      if name.all? { |item| item.is_a? Symbol }
        Kovacs::Nationality.validate_array(name)
        nationality = name[rand(name.size)]
        forenames = Kovacs::Resources.forenames(nationality, sex)
        forenames[rand(forenames.size)]
      elsif name.all? { |item| item.is_a? String }
        name[rand(name.size)]
      else
        raise ArgumentError.new("Wrong argument all elements have to be either symbol or string")
      end
    else
      raise "Wrong argument #{ name }"
    end
  end
end
