# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(first_name: "Nick", last_name: "Cage", username: "cagen", email: "nickcage@gmail.com", password: "test", password_confirmation: "test")
User.create(first_name: "Kill", last_name: "Bill", username: "killb", email: "killb@dead.com", password: "test", password_confirmation: "test")
