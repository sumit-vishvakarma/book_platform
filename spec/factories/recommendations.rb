# spec/factories/recommendations.rb
FactoryBot.define do
    factory :recommendation do
      review { "This is a great book!" }
      association :user
      association :book
    end
  end
  