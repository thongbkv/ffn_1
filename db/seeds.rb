# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create email: "admin@example.com", password: "12345678", password_confirmation: "12345678", role: :admin
User.create email: "user2@example.com", password: "12345678", password_confirmation: "12345678", role: :member
User.create email: "user3@example.com", password: "12345678", password_confirmation: "12345678", role: :member
User.create email: "user4@example.com", password: "12345678", password_confirmation: "12345678", role: :member
User.create email: "user5@example.com", password: "12345678", password_confirmation: "12345678", role: :member
