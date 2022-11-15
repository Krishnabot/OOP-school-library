class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
  
  def self.create_rental(books, people)
    if books.empty?
      puts 'You have no  books currwenly. Please add a book.'
    elsif people.empty?
      puts 'Person not found. Please add a person.'
    else
      puts 'Select a book from the following list by number'
      books.each do |book|
        puts "#{books.find_index(book)} - #{book.title}"
      end
      selected_book = gets.to_i
      print 'Date: '
      date = gets.chomp
      puts 'Select a person from the following list by number (not id)'
      people.each do |person|
        puts "#{people.find_index(person)} - #{person.name}"
      end
      selected_person = gets.to_i

      Rental.new(date, books[selected_book], people[selected_person])
    end
  end
end
