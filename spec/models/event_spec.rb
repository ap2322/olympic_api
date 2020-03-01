require 'rails_helper'

RSpec.describe Event, type: :model do
  it {should validate_presence_of :event}
  it { should validate_uniqueness_of(:event)}
end
