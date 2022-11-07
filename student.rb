# frozen_string_literal: true

require './person'

class Student < Person
  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
