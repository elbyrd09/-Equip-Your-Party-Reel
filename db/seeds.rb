# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Review.destroy_all
Rental.destroy_all
Item.destroy_all
User.destroy_all

# PASSWORD ALWAYS == 'password'

# create user with rentals
user_with_rentals = User.new(password: 'password', email: 'user1@gmail.com')
user_with_rentals.first_name = 'GuyWhoRents'
user_with_rentals.last_name = 'Jackson'
user_with_rentals.location = 'Canggu'
user_with_rentals.save

# create user who rents out his equipment

user_with_items = User.new(password: 'password', email: 'user2@hotmail.com')
user_with_items.first_name = 'GuyWhoOwns'
user_with_items.last_name = 'Smith'
user_with_items.location = 'Sanur'
user_with_items.save

# create
100.times do
  item = Item.new(user: user_with_items)
  item.available = true
  item.price_per_day = (rand * rand(1..10)).round(2)
  item.brand = Faker::Vehicle.manufacture #=> "Lamborghini"
  item.model = Faker::Vehicle.model #=> "A8"
  item.product_description = Faker::Vehicle.standard_specs.join('')
  item.user_description = Faker::Books::Lovecraft.sentence
  item.item_category = ["Camera", "Accessory", "Lens"].sample
  item.condition = ["Poor", "Sufficient", "Good", "As new"].sample
  item.save
end

# create rentals
3.times do
  rental = Rental.new(user: user_with_rentals, item: Item.all.sample)
  rental.start_date = Date.new(2020,2,3)
  rental.end_date = Date.new(2020,4,12)
  rental.total_price = (rand * rand(10..100)).round(2)
  rental.save
end

# create reviews
review = Review.new(rental: Rental.first)
review.content = "Great product, just awesome"
review.rating = rand(1..5)
review.save

review = Review.new(rental: Rental.last)
review.content = "Awful, horrible condition, owner was not reachable"
review.rating = rand(1..5)
review.save

