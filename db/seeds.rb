# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create!(
  name: 'test',
  description: 'aaaaaaa',
  price: 100,
  unit: 'yen', 
  genre_category_id: 1,
  saize_category_id: 1 
)

20.times do
  Item.create!(
    name: Faker::Food.dish,
    description: Faker::Lorem.paragraph(2),
    price: Faker::Number.within(10..100000),
    unit: %w(yen usd).sample,
    genre_category_id: 1,
    saize_category_id: 1
  )
end