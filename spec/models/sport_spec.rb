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
end
