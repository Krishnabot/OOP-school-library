require_relative '../trimmer_decorator'
require_relative '../person'

describe 'Testing the TrimmerDecorator class' do
  before :each do
    @person = Person.new(25, 'Stephen Light', true)
  end

  it 'Whether it return trimmed string or not' do
    trimmed_string = TrimmerDecorator.new(@person)
    expect(trimmed_string.correct_name).to eql 'Stephen Li'
  end
end
