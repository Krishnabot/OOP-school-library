require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exists?("people.json")
    object = JSON.parse(File.read("people.json"))
    object.each do |person|
      unless person["class"] == 'Teacher'
        student = Student.new(person["age"], person["name"], person["parent_permission"], person["classroom"])
        student.id = person["id"]
        people << student
      else
        teacher = Teacher.new(person["age"], person["name"], person["parent_permission"], person["specialization"])
        teacher.id = person["id"]
        people << teacher
      end
    end
  end

  def load_book
    # Load Books Here
  end

  def load_rentals
    #Load Rentals Here
  end

   def self.load_data(people, books, rentals)
    load_people(people)
    load_books(books)
    load_rentals(books, people, rentals)
  end

end
