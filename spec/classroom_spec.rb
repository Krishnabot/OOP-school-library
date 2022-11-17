require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new '9'
  end

  it 'returns the data to to given constructor' do
    expect(@classroom.label).to eql '9'
  end

  it 'check whether it is an object instance of classroom' do
    expect(@classroom).to be_an_instance_of Classroom
  end
end
