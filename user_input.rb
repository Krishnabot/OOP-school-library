require 'json'

class UserInput
  def self.save_people(people)
    people_json = []
    people.each do |person|
    unless person.class.to_s == 'Teacher'
      person = { 
        id: person.id.to_s, 
        name: person.name, 
        age: person.age,
        classroom: person.classroom,
        parent_permission: person.parent_permission.to_s
      }
      people_json << person
    else 
      person = { 
        id: person.id.to_s, 
        name: person.name, 
        age: person.age,
        specialization: person.specialization,
      }

      people_json << person
    end
    File.write("people.json", (people_json, {indent: "\t", object_nl: "\n"}))
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
