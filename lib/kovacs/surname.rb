require 'kovacs/resources'

module Kovacs::Surname
  extend self

  def generate(name)
    case name
    when NilClass
      nationalities = Kovacs::Resources.nationalities
      nationality = nationalities[rand(nationalities.size)]
      surnames = Kovacs::Resources.surnames(nationality, sex)
      surnames[rand(surnames.size)]
    when String
      name
    when Symbol
      Kovacs::Nationality.validate_symbol(name)
      surnames = Kovacs::Resources.surnames(name)
      surnames[rand(surnames.size)]
    when Array
      if name.all? { |item| item.is_a? Symbol }
        Kovacs::Nationality.validate_array(name)
        nationality = name[rand(name.size)]
        surenames = Kovacs::Resources.surnames(nationality)
        surenames[rand(surnames.size)]
      elsif name.all? { |item| item.is_a? String }
        name[rand(name.size)]
      else
        raise ArgumentError.new("Wrong argument all elements have to be either symbol or string")
      end

    else
      raise ArgumentError.new("Wrong argument type #{ name }")
    end
  end
end
