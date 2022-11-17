require_relative '../teacher'
require_relative '../person'

describe Teacher do
  before :each do
    @teacher = Teacher.new(23, 'Teacher1', false, 'Math')
  end

  context "When testing the 'Teacher' class" do
    it 'should return the correct data' do
      expect(@teacher.age).to eq 23
      expect(@teacher.name).to eq 'Teacher1'
      expect(@teacher.parent_permission).to eq false
      expect(@teacher.specialization).to eq 'Math'
    end

    it 'should always return true for can_use_service method' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
