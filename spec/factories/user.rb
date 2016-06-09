require "faker"

FactoryGirl.define do
  factory :user do
    name   {Faker::Name.name}
    email  Faker::Internet.safe_email
    password   "123456789"
    password_confirmation "123456789"
    role "admin"
  end
end
