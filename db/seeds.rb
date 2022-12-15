# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User can be created from the Front end using sign up form or like below
User.create(name: "user1", email: "user1@test.com", password: "123456")
User.create(name: "user2", email: "user2@test.com", password: "123456")

# Freelancer
Freelancer.create(
  name: "Tom",
  details: "Full-Stack Developer Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, quam?",
  photo: "https://static.tvmaze.com/uploads/images/medium_portrait/0/1815.jpg",
  fee: 280.00,
  location: "Munich"
)
Freelancer.create(
  name: "Cindy",
  details: "Full-Stack Developer Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, quam?",
  photo: "https://static.tvmaze.com/uploads/images/medium_portrait/0/1445.jpg",
  fee: 280.00,
  location: "Madrid"
)
Freelancer.create(
  name: "Nancy",
  details: "Full-Stack Developer Lorem ipsum dolor sit amet consectetur adipisicing elit. Placeat, quam?",
  photo: "https://static.tvmaze.com/uploads/images/medium_portrait/0/1398.jpg",
  fee: 200.00,
  location: "Milan"
)
