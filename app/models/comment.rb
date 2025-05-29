class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recommendation
  validates :content, presence: true, length: { maximum: 250 }
end
