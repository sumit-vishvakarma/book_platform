# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:recommendations) }
    it { should have_many(:votes) }
  end
end
