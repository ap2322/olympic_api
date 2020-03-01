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
end
