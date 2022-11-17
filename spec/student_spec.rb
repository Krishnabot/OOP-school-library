require_relative '../student'
require_relative '../person'
require_relative '../classroom'

describe Student do
  before :each do
    @classroom = Classroom.new('A123')
    @student = Student.new(23, 'Student1', true, @classroom)
  end

  context "When testing the 'Student' class" do
    it 'should return the correct data' do
      expect(@student.age).to eq 23
      expect(@student.name).to eq 'Student1'
      expect(@student.parent_permission).to eq true
      expect(@student.classroom.label).to eq 'A123'
    end

    it 'should return a new instance of the Student class' do
      expect(@student).to be_an_instance_of Student
    end
  end
end
