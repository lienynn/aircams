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
    model: "Canon EOS REBEL T7",
    price_per_day: 15,
    address: Faker::Address.full_address,
    details: "Comes with 18-55mm f lens. DSLR form factor with fine JPEG quality."
  }
)
camera_one.photo.attach(io: File.open('app/assets/images/canonrebel.png'), filename: 'canonrebel.png')
camera_one.user = user_one
camera_one.save!

camera_two = Camera.new(
  {
    model: "Nikon F",
    price_per_day: 20,
    address: Faker::Address.full_address,
    details: "Vintage camera. Comes with original finder and Nikkor-S 50mm lens."
  }
)
camera_two.photo.attach(io: File.open('app/assets/images/nikonf.jpeg'), filename: 'nikonf.jpeg')
camera_two.user = user_two
camera_two.save!

camera_three = Camera.new(
  {
    model: "Sony Alpha A7C",
    price_per_day: 20,
    address: Faker::Address.full_address,
    details: "Compact full-frame camera and lens combo. Very good image quality and noise performance! Great battery life."
  }
)
camera_three.photo.attach(io: File.open('app/assets/images/sonyalphaa7c.png'), filename: 'sonyalphaa7c.png')
camera_three.user = user_two
camera_three.save!

camera_four = Camera.new(
  {
    model: "Fujifilm x100v",
    price_per_day: 30,
    address: Faker::Address.full_address,
    details: "Beautiful camera with a vintage look. Great digital travel camera with fixed lens. Easy to use."
  }
)
camera_four.photo.attach(io: File.open('app/assets/images/fujifilmx100v.jpeg'), filename: 'fujifilmx100v.jpeg')
camera_four.user = user_one
camera_four.save!

camera_five = Camera.new(
  {
    model: "Pentax K1000",
    price_per_day: 25,
    address: Faker::Address.full_address,
    details: "Fully manual 35mm SLR, uses Kodak Plus-X 125 film. Takes beautiful photos. Excellent camera for all users."

  }
)
camera_five.photo.attach(io: File.open('app/assets/images/pentaxk1000.jpeg'), filename: 'pentaxk1000.jpeg')
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
