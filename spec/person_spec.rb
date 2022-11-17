require_relative '../person'

describe Person do
  before :each do
    @person_above_age_no_permission = Person.new(23, 'TestName1', false)
    @person_above_age_with_permission = Person.new(23, 'TestName2', true)
    @person_under_age_no_permission = Person.new(15, 'TestName3', false)
    @person_under_age_with_permission = Person.new(15, 'TestName4', true)
  end

  context "When testing the 'Person' class" do
    it 'should return correct data for new object' do
      expect(@person_above_age_no_permission.age).to eq 23
      expect(@person_above_age_no_permission.name).to eq 'TestName1'
      expect(@person_above_age_no_permission.parent_permission).to eq false
      expect(@person_above_age_no_permission.rentals).to be_empty
    end

    it 'should check if person can use service' do
      expect(@person_above_age_no_permission.can_use_services?).to eq true
      expect(@person_above_age_with_permission.can_use_services?).to eq true
      expect(@person_under_age_no_permission.can_use_services?).to eq false
      expect(@person_under_age_with_permission.can_use_services?).to eq true
    end

    it 'should return correct name' do
      expect(@person_above_age_no_permission.correct_name).to eq 'TestName1'
      expect(@person_above_age_with_permission.correct_name).to eq 'TestName2'
      expect(@person_under_age_no_permission.correct_name).to eq 'TestName3'
      expect(@person_under_age_with_permission.correct_name).to eq 'TestName4'
    end
  end
end
