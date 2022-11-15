require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exists?("people.json")
    object = JSON.parse(File.read("people.json"))
    object.each do |person|
      if person["class"] == 'Student'
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

  def self.load_books(books)
    # Load Books Here
    return books unless File.exists?('books.json')
    book_read = File.read('books.json')
    book_json = JSON.parse(book_read)
    book_json.each do |book|
      p book
      book = Book.new(book['title'], book['author'])
      books << book
    end
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
