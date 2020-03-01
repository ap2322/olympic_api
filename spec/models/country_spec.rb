require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validations' do
    it {should validate_presence_of :team}
    it { should validate_uniqueness_of(:team)}
  end

  describe 'relationships' do
    it {should have_many :olympians}
  end
end
