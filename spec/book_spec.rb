require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Book do
  before :each do
    @book = Book.new('The Metamorphosis', 'Franz Kafka')
  end
  it 'Whether returns the given data to the book constructor or not ' do
    expect(@book.title).to eq 'The Metamorphosis'
    expect(@book.author).to eq 'Franz Kafka'
  end

  it 'Whether it is an object instance of the Book class or not' do
    expect(@book).to be_an_instance_of Book
  end

  it 'Whether create_rental should return an object instance of the Rental class or not' do
    person = Person.new(14, 'James Kelly', true)
    rental = @book.create_rental(person, '10-14-2022')
    expect(rental).to be_an_instance_of Rental
  end
end
