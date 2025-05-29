class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :votes
end
