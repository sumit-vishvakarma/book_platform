# spec/models/vote_spec.rb
require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:recommendation) }
end
