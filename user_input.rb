require 'json'

class UserInput
  def self.save_people(people)
    people_json = []
    people.each do |person|
      person_data = if person.class.to_s == 'Teacher'
                 {
                   id: person.id.to_s,
                   class: person.class.to_s,
                   name: person.name,
                   age: person.age,
                   specialization: person.specialization,
                   parent_permission: person.parent_permission.to_s
                 }

               else
                 {
                   id: person.id.to_s,
                   class: person.class.to_s,
                   name: person.name,
                   age: person.age,
                   classroom: person.classroom,
                   parent_permission: person.parent_permission.to_s
                 }
               end
      people_json << person_data
      File.write('./data_store/people.json', JSON.pretty_generate(people_json))
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
    File.write('./data_store/books.json', JSON.pretty_generate(books_json))
  end

  def self.save_rentals(rentals)
    # Save  Rental Here
    rentals_json = []
    rentals.each do |rental|
      rental_data = {
        date: rental.date,
        book: rental.book.title,
        person: rental.person.id.to_s
      }
      rentals_json << rental_data
    end
    File.write('./data_store/rentals.json', JSON.pretty_generate(rentals_json))
  end

  def self.save_data(people, books, rentals)
    save_people(people)
    save_books(books)
    save_rentals(rentals)
  end
end
