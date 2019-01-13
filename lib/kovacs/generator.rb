module Kovacs
  class Generator 

    def initialize(config)
      @config ||= config
    end
    
    def generate
      
      check_input(@config)

      ret = {family: nil, middle: nil, given: nil}
      ret[:family] = evaluate(@config.family, :family)
      #ret[:middle] = evaluate_given(@config.middle, :given)
      #ret[:given] = evaluate_given(@config.given, :given)
      
      if ret
    end

    def info
      {
        family: @config.family,
        middle: @config.middle,
        given: @config.given,
        nationality: [:british],
        gender: ''
      }
    end

    private

    def evaluate(name, type=:given)
      if input.is_a? String
        name
      elsif input.is_a? Symbol
        if type == :given
          name = load_givenname(input)
        end
      elsif input.is_a? Array

      else
        nil
      end
    end

    def check_input(config)
      if config.nationality.nil? && 
          config.family.nil? &&
          config.middle.nil? &&
          config.given.nil? &&
          config.gender.nil?
        raise 'Empty config is not allowed!'
      end
    end
  end
end
