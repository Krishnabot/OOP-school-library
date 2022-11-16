require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exist?('./data_store/people.json')

    object = JSON.parse(File.read('./data_store/people.json'))
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
    return books unless File.exist?('./data_store/books.json')

    book_read = File.read('./data_store/books.json')
    book_json = JSON.parse(book_read)
    book_json.each do |book|
      book = Book.new(book['title'], book['author'])
      books << book
    end
  end

  def self.load_rentals(books, people, rentals)
    # Load Rentals Here
    return rentals unless File.exist?('./data_store/rentals.json')

    rental_read = File.read('./data_store/rentals.json')
    rental_json = JSON.parse(rental_read)
    rental_json.each do |rental|
      book_title = books.find do |book|
        book.title == rental['book']
      end
      person_id = people.find do |person|
        person.id == rental['person']
      end
      rental = Rental.new(rental['date'], book_title, person_id)
      rentals << rental
    end
  end
end
