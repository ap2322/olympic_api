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

  describe 'instance methods' do
    it 'returns the medal name for an olympian' do
      tony = Olympian.find_by(name: "Tontowi Ahmad")
      expect(tony.event_medal).to eq "Gold"

      no_medal_guy = Olympian.find_by(name: "Andreea Aanei")
      expect(no_medal_guy.event_medal).to eq "NA"
    end

    it 'returns the count of medals won' do
      medaled_olympian = Olympian.find_by(name: "Luc Abalo")
      expect(medaled_olympian.medals_won).to eq 1

      non_medaled_olympian = Olympian.find_by(name: "Andreea Aanei")
      expect(non_medaled_olympian.medals_won).to eq 0
    end
  end
end
