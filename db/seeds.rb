books = [
  { title: "The Great Gatsby", author: "F. Scott Fitzgerald", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "1984", author: "George Orwell", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "To Kill a Mockingbird", author: "Harper Lee", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Pride and Prejudice", author: "Jane Austen", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Moby Dick", author: "Herman Melville", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "The Hobbit", author: "J.R.R. Tolkien", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Fahrenheit 451", author: "Ray Bradbury", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "The Catcher in the Rye", author: "J.D. Salinger", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Jane Eyre", author: "Charlotte Brontë", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Brave New World", author: "Aldous Huxley", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "The Lord of the Rings", author: "J.R.R. Tolkien", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "The Alchemist", author: "Paulo Coelho", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Crime and Punishment", author: "Fyodor Dostoevsky", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Wuthering Heights", author: "Emily Brontë", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" },
  { title: "Animal Farm", author: "George Orwell", image_url: "https://covers.openlibrary.org/b/id/7222246-L.jpg" }
]

books.each do |book|
  Book.find_or_create_by!(book)
end

puts "✅ Seeded #{Book.count} books!"