# spec/factories/books.rb
FactoryBot.define do
    factory :book do
      title { "Sample Book Title" }
      author { "Author Name" }
      image_url { "http://example.com/image.jpg" }
    end
  end
  