module Kovacs::Nationality
  extend self

  def generate(nationality = nil)
    case nationality
    when NilClass
      nationalities = Kovacs::Resources.nationalities
      nationalities[rand(nationalities.size)]
    when Symbol
      validate_symbol(nationality)
      nationality
    when Array
      validate_array(nationality)
      nationality[rand(nationality.size)]
    when String
      nationality
    else
      raise ArgumentError.new("Wrong argument type #{ nationality.class }")
    end
  end

  def validate_symbol(nat)
    resource_path = "#{ Kovacs.root }/resources"
    nationalities = Dir.glob(resource_path + '/*').select { |f| File.directory?(f) }.map { |s| s.split('/')[-1].to_sym }
    unless nationalities.include?(nat)
      raise ArgumentError.new("Wrong argument does not exist #{ nat }")
    end
  end

  def validate_array(nats)
    if nats.empty? 
      raise ArgumentError.new("Wrong argument array is empty")
    end
    if nats.any? { |el| not el.is_a? Symbol }
      raise ArgumentError.new("Wrong argument one or more elements of array not symbol")
    end
    resource_path = "#{ Kovacs.root }/resources"
    nationalities = Dir.glob(resource_path + '/*').select { |f| File.directory?(f) }.map { |s| s.split('/')[-1].to_sym }
    ret = nats - nationalities
    unless ret.size === 0
      raise ArgumentError.new("Wrong argument one or more elements of array not exist")
    end
  end
end
