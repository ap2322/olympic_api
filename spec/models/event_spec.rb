require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it {should validate_presence_of :event}
    it { should validate_uniqueness_of(:event)}
  end

  describe 'relationships' do
    it {should belong_to :sport}
    it {should have_many :olympian_events}
  end
end
