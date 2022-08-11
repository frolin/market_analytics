# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create!(email: 'dev@dev.ru', password: 'qazwsx123')

PRODUCTS = [
  ['Сития 02 Николаос', '5200119080657'],
  ['Сития 02 премиум голд', '5200102951223'],
  ['Сития 02 премиум голд', '5200102953203'],
  ["KOKO", '5205657000631'],
  ['Хориатико', '5200362400349'],
  ['Agrilife', '8857121775285']
]

PRODUCTS.each do |product|
  product = Product.new(name: product.first,
                  barcode: product.second,
                  user_id: User.first.id)

  product.photos.new(image: FFaker::Image.file)

  product.save!
end
