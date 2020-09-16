# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Item.create!(
#   name: 'test',
#   description: 'aaaaaaa',
#   price: 100,
#   speed_id: 1, 
#   genre_category_id: 1,
#   saize_category_id: 1 
# )

# 20.times do
#   Item.create!(
#     name: Faker::Food.dish,
#     description: Faker::Lorem.paragraph(2),
#     price: Faker::Number.within(10..100000),
#     speed_id: 1,
#     genre_category_id: 1,
#     saize_category_id: 1
#   )
# end

  User.create!(nickname:  "管理者",
    email: "admin@example.jp",
    password:  "1234zxcv",
    password_confirmation: "1234zxcv",
    real_family_name: "店舗",
    real_first_name: "専用",
    reading_family_name: "テンポ",
    reading_first_name: "センヨウ",
    birthday: "2020-09-14",
    admin: true
  )