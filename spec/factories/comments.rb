FactoryBot.define do
  factory :comment do
    user { nil }
    recommendation { nil }
    content { "MyText" }
  end
end
