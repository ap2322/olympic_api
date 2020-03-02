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

  describe 'class methods' do
    it 'returns olympians who medaled in the event' do
      medaling_event = Event.find_by(event: "Badminton Mixed Doubles")

      expect(medaling_event.fetch_olympians_medalists.length).to eq 2
      expect(medaling_event.fetch_olympians_medalists.first).to be_a Olympian
    end
  end
end
