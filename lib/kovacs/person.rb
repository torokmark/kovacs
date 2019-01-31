module Kovacs
  class Person
    attr_accessor :nationality, :sex, :forename, :surname, :middle_name

    def name
      names = [] << surname << middle_name << forename
      if nationality.eq?(:hungarian)
        names.join(' ') 
      else
        names.reverse.join(' ')
      end
    end

    def to_h
      instance_variables.each_with_object({}) { |v, h| h[v.to_s.delete('@').to_sym] = instance_variable_get(v) }
    end

  end
end
