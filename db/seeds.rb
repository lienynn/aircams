require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Camera.create(
  {
    model: "Canon",
    price_per_day: 25,
    zip_code: "h2l3t4",
    details: "State: like new, 5mm lense. Film available to buy everywhere. Solid make perfetc for traveling.",
    user_id: 1
  }
)

Rental.create(
  {
    user_id: 2,
    camera_id: 1,
    start_date: Date.today,
    end_date: Faker::Date.forward(days: 10)
  }
)
