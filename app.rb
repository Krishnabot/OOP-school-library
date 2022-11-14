require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require 'colorize'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    user_response = 0
    puts "\n\nWelcome to OOP School Library App!\n\n".colorize(color: :green).underline
    while user_response != '9'
      puts "Please choose an option:\n\n".colorize(color: :magenta).bold
      app_options.each do |choice|
        if choice.include?("Exit")
          puts choice.colorize(color: :red)
        else
          puts choice.colorize(color: :blue)
        end
      end
      puts "\n\nEnter Option [number]: ".colorize(color: :blue).bold
      user_response = gets.chomp
      puts "\n\n"
      check_selection(user_response)

    end
    puts "Thank you for using this app!\n\n".colorize(color: :cyan).bold if user_response == '9'
  end

  def check_selection(response)
    case response
    when '0'
      list_all_books
    when '1'
      list_all_people
    when '2'
      list_all_students
    when '3'
      list_all_teachers
    when '4'
      create_person
    when '5'
      create_book
    when '6'
      create_rental
    when '7'
      list_all_rentals_person_id
    when '8'
      list_all_rentals_for_book
    end
  end

  def list_all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\" Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
  # rubocop:disable Metrics/MethodLength

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?[Input the number]: '
    person_choice = gets.chomp
    if person_choice != '1' && person_choice != '2'
      puts 'Invalid option'
    else
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      case person_choice
      when '1'
        puts 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'
        puts 'Please enter a classroom: '
        classroom = gets.chomp
        person = Student.new(age, name, parent_permission, classroom)
      when '2'
        puts 'specialization: '
        specialization = gets.chomp
        person = Teacher.new(age, name, true, specialization)
      end
    end
    @people << person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    @books << book
    puts 'Book created successfully' if @books.include?(book)
  end

  def create_rental
    if @books.empty?
      puts 'You have no  books currwenly. Please add a book.'
    elsif @people.empty?
      puts 'Person not found. Please add a person.'
    else
      puts 'Select a book from the following list by number'
      @books.each do |book|
        puts "#{@books.find_index(book)} - #{book.title}"
      end
      selected_book = gets.to_i
      puts 'Date: '
      date = gets.chomp
      puts 'Select a person from the following list by number (not id)'
      @people.each do |person|
        puts "#{@people.find_index(person)} - #{person.name}"
      end
      selected_person = gets.to_i
      rental = Rental.new(date, @books[selected_book], @people[selected_person])
      @rentals << rental
      puts 'Rental created successfully' if @rentals.include?(rental)
    end
  end
  # rubocop:enable Metrics/MethodLength

  def list_all_rentals_person_id
    list_all_people
    puts 'ID of person: '
    person_id = gets.to_i
    puts(@rentals.map do |rental|
      if rental.person.id == person_id
        "Rentals:\nDate: #{rental.date}  Book: #{rental.book.title}"
      else
        'No rentals found for this person'
      end
    end)
  end
end

p String.colors
p String.modes
