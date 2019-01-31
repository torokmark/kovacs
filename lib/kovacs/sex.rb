module Kovacs::Sex
  extend self

  def generate(sex)
    case sex
    when NilClass
      [:female, :male][rand(2)]
    when Symbol
      validate_symbol(sex)
      sex
    when String
      sex
    else
      raise "Wrong argument #{ sex }"
    end
  end

  def valid?(sex)
    [:male, :female].include?(sex)
  end

  private

  def validate_symbol(sex)
    unless [:male, :female].include?(sex)
      raise "Wrong argument #{ sex }"
    end
  end
end
