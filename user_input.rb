require 'json'

class UserInput
  def self.save_people(people)
    people_json = []
    people.each do |person|
    p person
    unless person.class.to_s == 'Teacher'
      person = {
        id: person.id.to_s,
        name: person.name,
        age: person.age,
        classroom: person.classroom,
        parent_permission: person.parent_permission
      }
    else
      person = {
        id: person.id.to_s,
        name: person.name,
        age: person.age,
        specialization: person.specialization,
      }
    end
    people_json << person
    File.write("people.json", JSON.pretty_generate(people_json))
    end
  end

  def save_books
    #Save Book Here
  end

  def save_rentals
    #Save  Rental Here
  end

  def self.save_data(people, books, rentals)
    save_people(people)
    save_books(books)
    save_rentals(rentals)
  end

end
