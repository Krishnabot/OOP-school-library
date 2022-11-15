require 'json'

class UserInput
  def self.save_people(people)
    people_json = []
    people.each do |person|
      person_data = {
        id: person.id.to_s,
        name: person.name,
        age: person.age
      }
      if person.class.to_s == 'Teacher'
        person_data[:specialization] = person.specialization
      else
        person_data[:classroom] = person.classroom
        person_data[:parent] = person.parent_permission
      end
      people_json << person_data
      File.write('people.json', JSON.pretty_generate(people_json))
    end
  end

  def self.save_books(books)
    # Save Book Here
    books_json = []
    books.each do |book|
      book_data = {
        title: book.title,
        author: book.author
      }
      books_json << book_data
    end
    File.write('books.json', JSON.pretty_generate(books_json))
  end

  def self.save_rentals(rentals)
    # Save  Rental Here
    rentals_json = [];
    rentals.each do |rental|
      rental_data = {
        date: rental.date,
        book: rental.book.title,
        person: rental.person.name
      }
      rentals_json << rental_data
    end
    File.write('rentals.json', JSON.pretty_generate(rentals_json))
  end

  def self.save_data(people, books, rentals)
    save_people(people)
    save_books(books)
    save_rentals(rentals)
  end
end
