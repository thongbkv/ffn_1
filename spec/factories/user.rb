require "faker"

FactoryGirl.define do
  factory  :admin, class: User do
    email  {Faker::Internet.safe_email}
    password "123456789"
    password_confirmation "123456789"
    role User.roles[:admin]
  end

  factory :member, class: User do
    email {Faker::Internet.safe_email}
    password "123456789"
    password_confirmation "123456789"
    role User.roles[:member]
  end
end
