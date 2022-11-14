require_relative 'app'
def main
  run
end

def app_options = [
    '[0]  =>  List all Books',
    '[1]  =>  List all People',
    '[2]  =>  List all Students',
    '[3]  =>  List all Teachers',
    '[4]  =>  Create a Person',
    '[5]  =>  Create a Book',
    '[6]  =>  Create a Rental',
    '[7]  =>  List all Rentals for a given Person',
    '[8]  =>  List all Rentals for a given Book',
    '[9]  =>  Exit'
  ]

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
    app = App.new
    case response
    when '0'
      app.list_all_books
    when '1'
      app.list_all_people
    when '2'
      app.list_all_students
    when '3'
      app.list_all_teachers
    when '4'
      app.create_person
    when '5'
      app.create_book
    when '6'
      app.create_rental
    when '7'
      app.list_all_rentals_person_id
    when '8'
      app.list_all_rentals_for_book
    end
  end


main
