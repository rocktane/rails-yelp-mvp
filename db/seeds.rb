# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Generating 10 restaurants...'
10.times do |restaurant|
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    phone_number: Faker::Address.zip_code,
    category: Restaurant::CATEGORY.sample,
    )
  puts "Created #{restaurant.name}"
  rand(1..4).times do |review|
    review = Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(1..5),
      restaurant_id: restaurant.id
    )
    puts "Created review"
  end
end
puts "Finished!"
