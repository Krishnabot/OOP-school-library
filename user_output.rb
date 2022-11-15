require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exist?('people.json')

    object = JSON.parse(File.read('people.json'))
    object.each do |person|
      if person['class'] == 'Student'
        student = Student.new(person['age'], person['name'], person['parent_permission'], person['classroom'])
        student.id = person['id']
        people << student
      else
        teacher = Teacher.new(person['age'], person['name'], person['parent_permission'], person['specialization'])
        teacher.id = person['id']
        people << teacher
      end
    end
  end

  def self.load_books(books)
    return books unless File.exist?('books.json')

    book_read = File.read('books.json')
    book_json = JSON.parse(book_read)
    book_json.each do |book|
      book = Book.new(book['title'], book['author'])
      books << book
    end
  end

  def self.load_rentals(rentals)
    # Load Rentals Here
    return rentals unless File.exist?('rentals.json')

    rental_read = File.read('rentals.json')
    rental_json = JSON.parse(rental_read)
    rental_json.each do |rental|
      rental = Rental.new(rental['date'], rental['book.title'], rental['person.name'])
      rentals << rental
    end
  end

  def self.load_data(people, books, rentals)
    load_people(people)
    load_books(books)
    load_rentals(books, people, rentals)
  end
end
