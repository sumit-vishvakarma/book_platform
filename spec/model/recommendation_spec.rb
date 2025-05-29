require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
    it { should have_many(:votes) }
  end

  describe "validations" do
    it { should validate_presence_of(:review) }
    it { should validate_length_of(:review).is_at_most(250) }
  end
end
