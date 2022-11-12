require_relative 'app'
def main
  def app_options
    puts '1 - List all Books'
    puts '2 - List all People'
    puts '3 - Create a Person'
    puts '4 - Create a Book'
    puts '5 - Create a Rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'.colorize(color: :red).underline
    puts "\n\n"
  end
  app = App.new
  app.run
end

main
