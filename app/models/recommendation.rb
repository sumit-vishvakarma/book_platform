class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :votes

  validates :review, presence: true, length: { maximum: 250 }

  def vote_count
    votes.count
  end
end
