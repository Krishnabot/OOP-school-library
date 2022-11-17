require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe 'Test the rental Class implementation' do
  before(:each) do
    @book = Book.new('Lord of the Flies', 'Martin G')
    @person = Person.new(32, 'Troost', 'Y')
    @rentals = Rental.new('02/02/2090', @book, @person)
  end

  describe 'Check the rental Instance for true date' do
    it 'Returns the date on the Rental class implementation' do
      expect(@rentals.date).not_to eql '01/02/2020'
    end
  end
end
