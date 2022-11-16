require 'json'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'user_input'
require_relative 'user_output'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    UserOutput.load_people(@people)
    UserOutput.load_books(@books)
    UserOutput.load_rentals(@books, @people, @rentals)

    user_response = 0
    puts "\n\nWelcome to OOP School Library App!\n\n"
    while user_response != '9'
      puts "Please choose an option:\n\n"
      app_options.each do |choice|
        puts choice
      end
      puts "\n\nEnter Option [number]: "
      user_response = gets.chomp
      puts "\n\n"
      check_selection(user_response)

    end
    puts "Thank you for using this app!\n\n" if user_response == '9'
    UserInput.save_data(@people, @books, @rentals)
  end

  def add_person
    person = Person.create_person
    @people << person
    puts "\n\nPerson created successfully" if @people.include?(person)
  end

  def add_book
    book = Book.create_book
    @books << book
    puts "\n\n Book added successfully" if @books.include?(book)
  end

  def add_rental
    rental = Rental.create_rental(@books, @people)
    @rentals << rental
    puts "\n\n Rental created successfully" if @rentals.include?(rental)
  end

  # rubocop:disable Metrics/CyclomaticComplexity
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
      add_person
    when '5'
      add_book
    when '6'
      add_rental
    when '7'
      Person.list_all_rentals_person_id(@people, @rentals)
    when '8'
      Book.list_all_rentals_for_book(@books, @rentals)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
