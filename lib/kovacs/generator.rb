module Kovacs
  class Generator 

    def initialize(config)
      @config ||= config
    end
    
    def generate
      #"#{ @config.family } #{ @config.middle } #{ @config.forename}"
      ret = {family: '', middle: '', forename: ''}
      ret[:family] = evaluate(@config.family)
      ret[:middle] = evaluate(@config.middle)
      ret[:forename] = evaluate(@config.forename)
    end

    def info
      {
        family: @config.family,
        middle: @config.middle,
        forename: @config.forename,
        nationality: [:british],
        gender: ''
      }
    end

    private

    def evaluate(name)
      if name.is_a? String
        name
      elsif name.is_a? Symbol
        
      elsif name.is_a? Array

      end
    end
  end
end
