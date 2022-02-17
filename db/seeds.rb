10.times do
  puts 'create a big restaurant'

  categorie = %w[chinese italian japanese french belgian].sample
  restaurant = Restaurant.new(name: Faker::Name.name, address: Faker::Address.full_address, category: categorie,
                              phone_number: Faker::Number.leading_zero_number(digits: 10))

  restaurant.save

  puts 'restaurant Save !! '
end
