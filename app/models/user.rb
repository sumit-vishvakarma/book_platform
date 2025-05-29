class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :recommendations
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
