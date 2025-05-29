class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :votes
  has_many :comments, dependent: :destroy

  validates :review, presence: true, length: { maximum: 250 }
  # scope :trending, -> {
  #       select('recommendations.*, COUNT(votes.id) as vote_count')
  #         .left_joins(:votes)
  #         .where('votes.created_at > ?', 7.days.ago)
  #         .group('recommendations.id')
  #         .order('vote_count DESC')
  #     }

  scope :trending, -> {
    all.sort_by { |rec| -rec.trending_score }
  }

# all loads all recommendations from the database (no filtering).
# Then .sort_by { |rec| -rec.trending_score } sorts all these recommendations by their trending score in descending order.
# -rec.trending_score means the highest score comes first (minus sign reverses the order).
# So, it returns an array of recommendations sorted by trending score.

  def trending_score
    votes.sum do |vote|
      age_in_hours = (Time.current - vote.created_at) / 1.hour

      case age_in_hours
      when 0..24 then 3
      when 24..168 then 2
      else 1
      end
    end
  end

# Time.current - vote.created_at gives time difference in seconds.
# Dividing by 1.hour converts it to hours.
# These weights favor recent votes more because recent votes count as 3 points, votes in last week count as 2, and older votes count as 1.
  
  def vote_count
    votes.count
  end
end
