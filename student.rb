require './person'

class Student < Person
  attr_reader :classroom

  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
  end

  def self.create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
    print 'Please enter a classroom: '
    classroom = gets.chomp
    new(age, name, parent_permission, classroom)
  end

  def self.lists_all_students(people)
    people.each do |person|
      if person.class.to_s == 'Teacher'
        'No students found, choose a different option to register a new student'
      else
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
