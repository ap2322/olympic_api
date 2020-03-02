require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it {should validate_presence_of :sport}
    it { should validate_uniqueness_of(:sport)}
  end

  describe 'relationships' do
    it {should have_many :events}
    it {should have_many :olympians}
  end

  describe 'instance methods' do
    it 'retrieves an array of names of all its events' do
      sport = Sport.order(:sport).first
      expected =  ["Archery Women's Individual", "Archery Women's Team", "Archery Men's Individual", "Archery Men's Team"]
      expect(sport.events_of_sport).to eq expected
    end
  end
end
