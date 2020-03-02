require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it { should validate_uniqueness_of(:name)}

  end

  describe 'relationships' do
    it {should belong_to :country}
    it {should belong_to :sport}
    it {should have_many :olympian_events}
  end

  describe 'class methods' do
    it 'finds the youngest olympian' do
      youngest_in_array = Olympian.find_youngest

      expect(youngest_in_array.length).to eq 1
      expect(youngest_in_array.first.name).to eq "Ana Iulia Dascl"
      expect(youngest_in_array.first.age).to eq 13
    end

    it 'finds the oldest olympian' do
      youngest_in_array = Olympian.find_oldest

      expect(youngest_in_array.length).to eq 1
      expect(youngest_in_array.first.name).to eq "Julie Brougham"
      expect(youngest_in_array.first.age).to eq 62
    end

    it 'counts the olympians' do
      expect(Olympian.total_competing_olympians).to eq 2850
    end

    it 'finds the average age of all olympians' do
      expect(Olympian.average_age).to eq 26
    end

    it 'finds the average weight by gender' do
      expect(Olympian.average_weight_male).to eq 77.9
      expect(Olympian.average_weight_female).to eq 61.4
    end
  end
end
