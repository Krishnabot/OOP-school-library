require './person'

class Student < Person
  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
    add_classroom(@classroom)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
