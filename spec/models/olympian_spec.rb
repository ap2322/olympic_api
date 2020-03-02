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
  end
end
