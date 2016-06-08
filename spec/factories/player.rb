require "faker"

FactoryGirl.define do
  factory :player do
    name            {Faker::Name.name}
    position        "Tien dao"
    nationality     "VietNam"
    jersey_number   10
    image           {Faker::Avatar.image}
  end
end
