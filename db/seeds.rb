require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rental.destroy_all
Camera.destroy_all
User.destroy_all

# users
user_one = User.create!(
  {
    email: "g@g.g",
    password: "secret"
  }
)

user_two = User.create!(
  {
    email: "p@p.p",
    password: "secret"
  }
)

# cameras
camera_one = Camera.new(
  {
    model: "Canon",
    price_per_day: 25,
    zip_code: "h2l3t4",
    details: "State: like new, 5mm lense. Film available to buy everywhere. Solid make perfetc for traveling."
  }
)
camera_one.user = user_one
camera_one.save!

camera_two = Camera.new(
  {
    model: "Nikon",
    price_per_day: 10,
    zip_code: "j1j3a3",
    details: "Vintage camera. Awesome for old pictures like style."
  }
)
camera_two.user = user_two
camera_two.save!

camera_three = Camera.new(
  {
    model: "Sony",
    price_per_day: 20,
    zip_code: "t5t6y6",
    details: "Brand new, comes with all types of lenses."
  }
)
camera_three.user = user_two
camera_three.save!

camera_four = Camera.new(
  {
    model: "Fujifilm",
    price_per_day: 5,
    zip_code: "h4d0p0",
    details: "Nice camera. Perfect for travel memories and night pictures."
  }
)

camera_four.user = user_one
camera_four.save!

camera_five = Camera.new(
  {
    model: "Panasonic",
    price_per_day: 4,
    zip_code: "a0a2h2",
    details: "Perfect for sightseeing! Good picture quality."
  }
)
camera_five.user = user_one
camera_five.save!

# # rentals
rental_one = Rental.new(
  {
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 10)
  }
)
rental_one.user = user_two
rental_one.camera = camera_one
rental_one.save!

rental_two = Rental.new(
  {
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 5)
  }
)
rental_two.user = user_one
rental_two.camera = camera_two
rental_two.save!

rental_three = Rental.new(
  {
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 20)
  }
)

rental_three.user = user_two
rental_three.camera = camera_five
rental_three.save!

