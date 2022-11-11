require_relative 'nameable'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    super()
    @nameable.correct_name
  end
end
