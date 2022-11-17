require_relative '../capitalize_decorator'
require_relative '../person'

describe 'Testing for CapitalizeDecorator class ' do
  before :each do
    @person = Person.new(42, 'almeda', false)
  end

  it ' whether it returns capitalised string or not' do
    capitalized_string = CapitalizeDecorator.new(@person)
    expect(capitalized_string.correct_name).to eql 'Almeda'
  end
end
