require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    user_response = 0
    puts "\n\nWelcome to OOP School Library App!\n\n"
    while user_response != '9'
      puts "Please choose an option:\n\n"
      app_options.each do |choice|
        if choice.include?("Exit")
          puts choice
        else
          puts choice
        end
      end
      puts "\n\nEnter Option [number]: "
      user_response = gets.chomp
      puts "\n\n"
      check_selection(user_response)

    end
    puts "Thank you for using this app!\n\n" if user_response == '9'
  end

  def check_selection(response)
    case response
    when '0'
      Book.list_all_books(@books)
    when '1'
      Person.list_all_people(@people)
    when '2'
      Student.lists_all_students(@people)
    when '3'
      Teacher.lists_all_teachers(@people)
    when '4'
      person = Person.create_person
      @people << person
      puts "\n\nPerson created successfully" if @people.include?(person)
    when '5'
      book = Book.create_book
      @books << book
      puts "\n\n Book added successfully" if @books.include?(book)

    when '6'
      rental = Rental.create_rental(@books, @people)
      @rentals << rental
      puts "\n\n Rental created successfully" if @rentals.include?(rental)
    when '7'
      Person.list_all_rentals_person_id(@people, @rentals)
    when '8'
      Book.list_all_rentals_for_book(@books, @rentals)
    end
  end

  # def list_all_books
  #   @books.each do |book|
  #     puts "Title: \"#{book.title}\" Author: #{book.author}"
  #   end
  # end

  # def list_all_people
  #   @people.each do |person|
  #     puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  #   end
  # end
  # rubocop:disable Metrics/MethodLength

  # rubocop:enable Metrics/MethodLength

end
